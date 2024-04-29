using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using insuranceWebAPI.Models;


namespace insuranceWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserPoliciesController : ControllerBase
    {
        private readonly InsuranceContext _context;

        public UserPoliciesController(InsuranceContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IEnumerable<UserPolicy>> Get()
        {
            return await _context.UserPolicies.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            if (id<0)
                return BadRequest();
            var users = await _context.UserPolicies.Where(u => u.UserId == id).ToListAsync();


            if (users == null)
            {
                return NotFound();
            }

            return Ok(users);

        }

        [HttpPost]
        public async Task<IActionResult> Post(UserPolicy subs)
        {
            _context.Add(subs);
            await _context.SaveChangesAsync();
            return Ok();
        }

    }
}