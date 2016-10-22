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
Content-Length: 175
Content-Type: application/json; charset=utf-8
ETag: W/"5e2d30686efb3a808d1e3a9aca515d0c"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 253961c9-6bee-4d01-929d-bb390affb4cb
X-Runtime: 0.020205
X-XSS-Protection: 1; mode=block

{
  "status": 200,
  "message": "",
  "user": {
    "id": 2,
    "name": "testuser2",
    "token": "6DTYAW8ZwhHo3zk92XMYtA",
    "created_at": "2016-10-22T02:35:39.492Z",
    "updated_at": "2016-10-22T02:35:39.492Z"
  }
}
```

## GET #show
ユーザーの情報を取得.

### Example

#### Request
```
GET /users/1?token=aaa HTTP/1.1
Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
Content-Length: 0
Content-Type: application/x-www-form-urlencoded
Host: www.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 155
Content-Type: application/json; charset=utf-8
ETag: W/"69b75dddaea9e4de6cc4533a32abc0c9"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 6e40f5be-cb23-4007-a963-6434f5d07747
X-Runtime: 0.004774
X-XSS-Protection: 1; mode=block

{
  "status": 200,
  "message": "",
  "user": {
    "id": 1,
    "name": "testuser",
    "token": "aaa",
    "created_at": "2016-10-22T02:35:39.523Z",
    "updated_at": "2016-10-22T02:35:39.523Z"
  }
}
```
