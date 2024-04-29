using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using insuranceWebAPI.Models;

namespace insuranceWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PoliciesController : ControllerBase
    {
        private readonly InsuranceContext _context;

        public PoliciesController(InsuranceContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IEnumerable<Policy>> Get()
        {
            return await _context.Policies.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            if (id < 1)
                return BadRequest();
            var policy = await _context.Policies.FirstOrDefaultAsync(m => m.PolicyId == id);
            if (policy == null)
                return NotFound();
            return Ok(policy);

        }
    }
}