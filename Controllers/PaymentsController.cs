using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using insuranceWebAPI.Models;


namespace insuranceWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PaymentsController : ControllerBase
    {
        private readonly InsuranceContext _context;

        public PaymentsController(InsuranceContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IEnumerable<PaymentDetail>> Get()
        {
            return await _context.PaymentDetails.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            if (id < 1)
                return BadRequest();
            var cards = await _context.PaymentDetails.Where(u => u.UserId == id).ToListAsync();
            if (cards== null)
                return NotFound();
            return Ok(cards);

        }

        [HttpPost]
        public async Task<IActionResult> Post(PaymentDetail card)
        {
            _context.Add(card);
            await _context.SaveChangesAsync();
            return Ok();
        }

        [HttpPut]
        public async Task<IActionResult> Put(PaymentDetail cardData)
        {
            if (cardData == null)
                return BadRequest();

            var card = await _context.PaymentDetails.FindAsync(cardData.Id);
            if (card == null)
                return NotFound();
            card.CardOwner = cardData.CardOwner;
            card.CardNumber = cardData.CardNumber;
            card.ExpiryDate = cardData.ExpiryDate;

            await _context.SaveChangesAsync();
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (id < 1)
                return BadRequest();
            var card = await _context.PaymentDetails.FirstOrDefaultAsync(m => m.Id == id);
            if (card == null)
                return NotFound();
            _context.PaymentDetails.Remove(card);
            await _context.SaveChangesAsync();
            return Ok();

        }
    }
}