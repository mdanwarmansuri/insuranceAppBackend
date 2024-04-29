using System;
using System.Collections.Generic;

namespace insuranceWebAPI.Models;

public partial class User
{
    public int UserId { get; set; }

    public int? EmpId { get; set; }

    public string? EmpName { get; set; }

    public string? CompanyName { get; set; }

    public string? Username { get; set; }

    public string? Password { get; set; }
}
