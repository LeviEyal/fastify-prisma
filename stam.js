const http = require('http');

class MyPromise {
  constructor(fn) {
    this.state = 'pending';
    this.value = null;
    this.handlers = [];
    fn(this._resolve.bind(this));
  }

  _resolve(value) {
    if (this.state === 'pending') {
      this.state = 'resolved';
      this.value = value;
      this.handlers.forEach(handler => handler(value));
    }
  }

  then(onResolved) {
    if (this.state === 'resolved') {
      onResolved(this.value);
    } else {
      this.handlers.push(onResolved);
    }
  }
}

// new MyPromise((resolve, reject) => {
//   setTimeout(() => {
//     resolve('Hello World!');
//   }, 2000);
// }).then((value) => {
//   console.log(value);
// });

const get = (url) => {
  return new MyPromise((resolve, reject) => {
    http.get(url, (res) => {
      let body = '';
      res.on('data', (chunk) => {
        body += chunk;
      });
      res.on('end', () => {
        resolve(body);
      });
    });

  });
};


get('http://jsonplaceholder.typicode.com/todos/1').then((value) => {
  console.log(value);
});