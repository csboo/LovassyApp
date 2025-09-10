# ===== Base SDK Stage =====
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS sdk
WORKDIR /src

# Copy solution, helpers & project files
COPY ./LovassyApp.sln ./
COPY ./Blueboard/Blueboard.csproj Blueboard/
COPY ./Helpers.WebApi/Helpers.WebApi.csproj Helpers.WebApi/
COPY ./Helpers.Cryptography/Helpers.Cryptography.csproj Helpers.Cryptography/
COPY ./Helpers.Cryptography.Tests/Helpers.Cryptography.Tests.csproj Helpers.Cryptography.Tests/
COPY ./Helpers.Email/Helpers.Email.csproj Helpers.Email/

RUN dotnet restore

# Copy source code
COPY ./Blueboard Blueboard/
COPY ./Helpers.WebApi Helpers.WebApi/
COPY ./Helpers.Cryptography Helpers.Cryptography/
COPY ./Helpers.Email Helpers.Email/

# ===== Build / Publish stage =====
FROM sdk AS build
WORKDIR /src/Blueboard
RUN dotnet publish -c Release -o /app/publish

# ===== Runtime stage =====
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 8080
ENTRYPOINT ["dotnet", "Blueboard.dll"]
