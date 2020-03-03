# Cosmos Testnet Faucet

This faucet app allows anyone who passes a captcha to request tokens for a Cosmos account address. This app needs to be deployed on a Cosmos testnet light client (or full node), because it relies on using the `enigmacli` command to send tokens.

## Prerequisites

### reCAPTCHA

If you don't have a reCAPTCHA site setup for the faucet, now is the time to get one. Go to the [Google reCAPTCHA Admin](https://www.google.com/recaptcha/admin) and create a new reCAPTCHA site. For the version of captcha, choose `reCAPTCHA v2`.

### Checkout Code

For the backend you need to have Go installed. For the frontend, you also need to have node.js and the `yarn` dependency tool installed.

## Backend Setup

### Production

First, set the environment variables for the backend, using `./backend/.env` as a template:

```
cd backend
cp .env .env.local
vim .env.local
```

Then build the backend.

```
go mod init github.com/enigmampc/testnet-faucet/backend
go mod tidy
go build faucet.go
```

The following executable will run the faucet backend. 

```
./faucet
```

**WARNING**: It's highly recommended to run a reverse proxy with rate limiting in front of this app. Included in this repo is an example `Caddyfile` that lets you run an TLS secured faucet that is rate limited to 1 claim per IP per day.

### Development

Run `go run faucet.go` in the `backend` directory to serve the backend.

## Frontend Setup

### Production

First, set the environment variables for the frontend, using `./frontend/.env` as a template:

```
cd frontend
cp .env .env.local
vim .env.local
```

Then build the frontend.

```
yarn
yarn build
```

Lastly, serve the `./frontend/dist` directory with the web server of your choice.

### Development

Run `yarn serve` in the `frontend` directory to serve the frontend with hot reload.

## In Production

Place `faucet` executable, `dist` folder and `.env`,`.env.local` files in the same path and run

```bash
vim .env
cp .env .env.local
./facuet
```