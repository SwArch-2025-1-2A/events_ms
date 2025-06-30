# Imagen de .net
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /App

# Exponemos el puerto
EXPOSE ${mu_events_ms_INTERNAL_PORT:-8080}

# Release no produce el endpoint con el Swagger, Development sí

ARG BUILD_CONFIGURATION=${mu_events_ms_BUILD_CONFIGURATION:-Release}
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