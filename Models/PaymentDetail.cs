using System;
using System.Collections.Generic;

namespace insuranceWebAPI.Models;

public partial class PaymentDetail
{
    public int Id { get; set; }

    public int? UserId { get; set; }

    public string? CardOwner { get; set; }

    public long? CardNumber { get; set; }

    public string? ExpiryDate { get; set; }

    public int? SecurityCode { get; set; }
}
