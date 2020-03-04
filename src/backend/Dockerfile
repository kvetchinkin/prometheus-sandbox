ARG BUILD_IMAGE=mcr.microsoft.com/dotnet/core/sdk:3.1
ARG RUN_IMAGE=mcr.microsoft.com/dotnet/core/aspnet:3.1

FROM $BUILD_IMAGE AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY ./backend.API/*.csproj ./backend.API/
COPY NuGet.Config ./backend.API/
WORKDIR /app/backend.API
RUN dotnet restore --configfile NuGet.Config

# copy and publish app and libraries
WORKDIR /app/
COPY backend.API/. ./backend.API/
WORKDIR /app/backend.API
RUN dotnet publish -c Release -o out

FROM $RUN_IMAGE
WORKDIR /app
COPY --from=build /app/backend.API/out ./
ENTRYPOINT [ "dotnet", "backend.API.dll" ]
