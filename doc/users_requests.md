## POST #create
ユーザーを作成.

### Example

#### Request
```
POST /users HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 14
Content-Type: application/x-www-form-urlencoded
Host: www.example.com

name=testuser2
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 142
Content-Type: application/json; charset=utf-8
ETag: W/"0dc662e75318e4d63e95342f5f531465"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 8be64796-d2bd-4a6a-903a-9849b9ae457d
X-Runtime: 0.016387
X-XSS-Protection: 1; mode=block

{
  "status": 200,
  "message": "",
  "user": {
    "id": 2,
    "name": "testuser2",
    "created_at": "2016-09-13T13:15:21.938Z",
    "updated_at": "2016-09-13T13:15:21.938Z"
  }
}
```

## GET #show
ユーザーの情報を取得.

### Example

#### Request
```
GET /users/1 HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 141
Content-Type: application/json; charset=utf-8
ETag: W/"307d1139b4a95564ae9d7ca49a226da8"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 93ca7195-d3ed-4beb-9df4-9e7e88614c8b
X-Runtime: 0.004971
X-XSS-Protection: 1; mode=block

{
  "status": 200,
  "message": "",
  "user": {
    "id": 1,
    "name": "testuser",
    "created_at": "2016-09-13T13:15:21.968Z",
    "updated_at": "2016-09-13T13:15:21.968Z"
  }
}
```
