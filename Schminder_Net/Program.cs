

using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using Schminder_Net.ef;
using Schminder_Net.Models;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.FileProviders;
using FirebaseAdmin;
using Google.Apis.Auth.OAuth2;

var builder = WebApplication.CreateBuilder(args);
var services = builder.Services;
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
var cookieAuthOptions = new CookieAuthOptions();

builder.Logging.ClearProviders();
builder.Logging.AddConsole();

builder.Configuration.GetSection("CookieAuth").Bind(cookieAuthOptions);
builder.Services.AddDbContext<dbContext>(options => options.UseSqlServer(connectionString));



// Add services to the container.
builder.Services.AddControllersWithViews();

FirebaseApp.Create(new AppOptions()
{
    Credential = GoogleCredential.FromFile("schminder-9bd82-firebase-adminsdk-fbsvc-0452be1f84.json")
});


var jwtSettings = builder.Configuration.GetSection("JwtSettings");
var key = Encoding.UTF8.GetBytes(jwtSettings["SecretKey"]!);

builder.Services.AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddJwtBearer(options =>
{
    options.RequireHttpsMetadata = false;
    options.SaveToken = true;
    options.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(key),
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidIssuer = jwtSettings["Issuer"],
        ValidAudience = jwtSettings["Audience"],
        ClockSkew = TimeSpan.Zero
    };
});
/*
services.AddAuthentication("CookieAuth")
    .AddCookie("CookieAuth", config =>
    {
        config.Cookie.Name = cookieAuthOptions.CookieName;
        config.LoginPath = "/Admin/Login";
        config.LogoutPath = "/Admin/LogOut";
    });
*/

var app = builder.Build();

app.UseMiddleware<FirebaseAuthMiddleware>();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

//app.UseHttpsRedirection();
app.UseStaticFiles();
var physicalDistPath = Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), @"..\..\dist"));
if (app.Environment.IsDevelopment())
{
    var distPath = Path.GetFullPath(Path.Combine(Directory.GetCurrentDirectory(), @"..\..\dist"));
    if (Directory.Exists(distPath))
    {
        Console.WriteLine("✔ Serving static files from: " + distPath);
        app.UseStaticFiles(new StaticFileOptions
        {
            FileProvider = new PhysicalFileProvider(distPath),
            RequestPath = "/dist"
        });
    }
    else
    {
        Console.WriteLine("❌ DIST FOLDER NOT FOUND: " + distPath);
    }
}

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
