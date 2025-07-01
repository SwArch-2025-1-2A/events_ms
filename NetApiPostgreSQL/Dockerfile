# Imagen de .net
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /App

# Exponemos el puerto
EXPOSE 8080

# Copia configuracion del proyecto
COPY ./*.csproj ./

# Re crea el proyecto
RUN dotnet restore

# Copia todo lo demas
COPY . .

# Crea una publicacion del proyecto
RUN dotnet publish -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /App
COPY --from=build /App/out .
ENTRYPOINT ["dotnet", "NetApiPostgreSQL.dll"]