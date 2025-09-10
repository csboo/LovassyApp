# ===== Base SDK Stage =====
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS sdk
WORKDIR /src

# Copy solution & project files
COPY LovassyApp.sln ./
COPY Blueboard/Blueboard.csproj Blueboard/

# Copy all source
COPY . .

# ===== Build / Publish stage =====
FROM sdk AS build
WORKDIR /src/Blueboard
RUN dotnet restore
RUN dotnet publish -c Release -o /app/publish

# ===== Runtime stage =====
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 8080
ENTRYPOINT ["dotnet", "Blueboard.dll"]
