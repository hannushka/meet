import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import './global.css';

import { Nav, Sidebar } from './layout';
import { Events } from './events';

function NoMatch() {
  return (
    <div className="app">
      <h1>Nothing here :(</h1>
    </div>
  );
}

const Root = () => {
  return (
    <React.Fragment>
      <div className="app-container">
        <BrowserRouter>
          <Switch>
            <Route
              path="/:id"
              render={props => (
                <div>
                  <Nav {...props} />
                  <Route path={`${props.match.url}/events`} component={Events} />
                </div>
              )}
            />
            <Route path="" component={NoMatch} />
          </Switch>
        </BrowserRouter>
      </div>
      <Sidebar />
    </React.Fragment>
  );
};

const rootElement = document.getElementById('root');
ReactDOM.render(<Root />, rootElement);
