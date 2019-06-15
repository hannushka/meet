import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

import './styles.css';

function App() {
  return (
    <div className="app">
      <h1>Hello World! :)</h1>
    </div>
  );
}

function NoMatch() {
  return (
    <div className="app">
      <h1>Nothing here :(</h1>
    </div>
  );
}

const Root = () => {
  return (
    <BrowserRouter>
      <Switch>
        <Route path="/" exact component={App} />
        <Route path="" component={NoMatch} />
      </Switch>
    </BrowserRouter>
  );
};

const rootElement = document.getElementById('root');
ReactDOM.render(<Root />, rootElement);
