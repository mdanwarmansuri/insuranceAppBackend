using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using insuranceWebAPI.Models;

namespace insuranceWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly InsuranceContext _context;

        public UsersController(InsuranceContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IEnumerable<User>> Get()
        {
            return await _context.Users.ToListAsync();
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            if (id <1)
                return BadRequest();
            var user = await _context.Users.FirstOrDefaultAsync(m => m.EmpId == id);
            if (user == null)
                return NotFound();
            return Ok(user);

        }

        [HttpPost]
        public async Task<IActionResult> Post(User user)
        {
            _context.Add(user);
            await _context.SaveChangesAsync();
            return Ok();
        }

        [HttpPut]
        public async Task<IActionResult> Put(User userData)
        {
            if (userData == null || userData.EmpId <1)
                return BadRequest();

            var user = await _context.Users.FindAsync(userData.EmpId);
            if (user == null)
                return NotFound();
            user.EmpName = userData.EmpName;
            user.CompanyName = userData.CompanyName;
            user.Username = userData.Username;
            user.Username = userData.Username;
            user.Password = userData.Password;
            await _context.SaveChangesAsync();
            return Ok();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            if (id <1)
                return BadRequest();
            var product = await _context.Users.FindAsync(id);
            if (product == null)
                return NotFound();
            _context.Users.Remove(product);
            await _context.SaveChangesAsync();
            return Ok();

        }

        [HttpGet]
        [Route("api/users/{username}/password")]
        public async Task<IActionResult> GetPassword(string username)
        {
            // Retrieve the user from the database based on the provided username
            var user = await _context.Users.FirstOrDefaultAsync(m => m.Username == username);

            if (user == null)
            {
                return NotFound(); // User not found
            }

            // Return the password in the response
            return Ok(user);
        }

    }
}