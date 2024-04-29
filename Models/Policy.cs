using System;
using System.Collections.Generic;

namespace insuranceWebAPI.Models;

public partial class Policy
{
    public int PolicyId { get; set; }

    public string? PolicyName { get; set; }

    public string? Insurer { get; set; }

    public string? Tpa { get; set; }

    public string? Description { get; set; }
}
