using NetApiPostgreSQL;
using NetApiPostgreSQL.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//PostgreSQL Config

var postgresConfig = new PostgresSQL(builder.Configuration["PostgresSQL"]);

builder.Services.AddSingleton(postgresConfig);
builder.Services.AddScoped<EventosInterface, Eventos>();

//App
var app = builder.Build();

// Configure the HTTP request pipeline.

app.UseSwagger();
app.UseSwaggerUI();

//app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
