import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import './styles.css';

function App() {
  return (
    <div>
      <h1>Hello World! :)</h1>
    </div>
  );
}

function NoMatch(_) {
  return (
    <div>
      <h3>Nothing to see here :(</h3>
    </div>
  );
}

const Root = () => {
  return (
    <div className="app">
      <BrowserRouter>
        <Switch>
          <Route path="/" exact component={App} />
          <Route path="" component={NoMatch} />
        </Switch>
      </BrowserRouter>
    </div>
  );
};

const rootElement = document.getElementById('root');
ReactDOM.render(<Root />, rootElement);
