
## About Crypto-IRIS Application
This is an application to show how to use cryptography with Python and IRIS

## Installation
1. Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/crypto-iris.git
```

2. Open a Docker terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container:

```
$ docker-compose up -d 
```

4. Go to your Postman (or other similar REST client) and config the request like this image to encrypt:

![Request Encrypt messages](https://github.com/yurimarx/crypto-iris/raw/main/encrypt.png "Request Encrypt messages")

- Method: POST
- URL: http://localhost:52773/crypto-iris/encrypt 
- Body: raw

5. Click send and get text encrypted as binary hex message

6. Go to your Postman (or other similar REST client) and config the request like this image to decrypt:

![Request Decrypt messages](https://github.com/yurimarx/crypto-iris/raw/main/decrypt.png "Request Decrypt messages")

- Method: POST
- URL: http://localhost:52773/crypto-iris/decrypt 
- Body: raw

7. Click send and get text decrypted as string message


# Credits
This application used pyDes project
