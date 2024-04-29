using System;
using System.Collections.Generic;

namespace insuranceWebAPI.Models;

public partial class UserPolicy
{
    public int UserId { get; set; }

    public int PolicyId { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }
}
