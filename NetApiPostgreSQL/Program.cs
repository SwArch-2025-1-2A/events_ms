using NetApiPostgreSQL;
using NetApiPostgreSQL.Repositories;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//PostgreSQL Config
var dbHost = builder.Configuration["DB_HOSTNAME"];
var dbPort = builder.Configuration["DB_PORT"];
var dbName = builder.Configuration["DB_NAME"];
var dbUser = builder.Configuration["DB_USER"];
var dbPassword = builder.Configuration["DB_PASSWORD"];
var connectionString = $"Host={dbHost};" + $"Port={dbPort};" + $"Database={dbName};" + $"Username={dbUser};" + $"Password={dbPassword};";
var postgresConfig = new PostgresSQL(connectionString);

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
