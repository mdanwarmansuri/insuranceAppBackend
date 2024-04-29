using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace insuranceWebAPI.Models;

public partial class InsuranceContext : DbContext
{
   

    public InsuranceContext(DbContextOptions<InsuranceContext> options)
        : base(options)
    {
    }

    public virtual DbSet<PaymentDetail> PaymentDetails { get; set; }

    public virtual DbSet<Policy> Policies { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<UserPolicy> UserPolicies { get; set; }

   
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<PaymentDetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("PK__payment___3213E83F2193319F");

            entity.ToTable("payment_details");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CardNumber).HasColumnName("card_number");
            entity.Property(e => e.CardOwner)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("card_owner");
            entity.Property(e => e.ExpiryDate)
                .HasMaxLength(5)
                .IsUnicode(false)
                .HasColumnName("expiry_date");
            entity.Property(e => e.SecurityCode).HasColumnName("security_code");
            entity.Property(e => e.UserId).HasColumnName("user_id");
        });

        modelBuilder.Entity<Policy>(entity =>
        {
            entity.HasKey(e => e.PolicyId).HasName("PK__policy__47DA3F03D40DC797");

            entity.ToTable("policy");

            entity.Property(e => e.PolicyId)
                .ValueGeneratedNever()
                .HasColumnName("policy_id");
            entity.Property(e => e.Description)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("description");
            entity.Property(e => e.Insurer)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("insurer");
            entity.Property(e => e.PolicyName)
                .HasMaxLength(200)
                .IsUnicode(false)
                .HasColumnName("policy_name");
            entity.Property(e => e.Tpa)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("tpa");
        });

        modelBuilder.Entity<User>(entity =>
        {
            entity.HasKey(e => e.UserId).HasName("PK__users__B9BE370F533EFEEA");

            entity.ToTable("users");

            entity.Property(e => e.UserId)
                .ValueGeneratedNever()
                .HasColumnName("user_id");
            entity.Property(e => e.CompanyName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("company_name");
            entity.Property(e => e.EmpId).HasColumnName("emp_id");
            entity.Property(e => e.EmpName)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("emp_name");
            entity.Property(e => e.Password)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("password");
            entity.Property(e => e.Username)
                .HasMaxLength(100)
                .IsUnicode(false)
                .HasColumnName("username");
        });

        modelBuilder.Entity<UserPolicy>(entity =>
        {
            entity.HasKey(e => new { e.UserId, e.PolicyId }).HasName("PK__user_pol__9DC394FF44C29331");

            entity.ToTable("user_policy");

            entity.Property(e => e.UserId).HasColumnName("user_id");
            entity.Property(e => e.PolicyId).HasColumnName("policy_id");
            entity.Property(e => e.EndDate)
                .HasColumnType("date")
                .HasColumnName("end_date");
            entity.Property(e => e.StartDate)
                .HasColumnType("date")
                .HasColumnName("start_date");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
