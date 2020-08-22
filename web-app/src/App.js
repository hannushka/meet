import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter, Route, Switch } from 'react-router-dom';
import './global.css';
import { Feed } from './containers/Feed';
import { library } from '@fortawesome/fontawesome-svg-core';
import { fab } from '@fortawesome/free-brands-svg-icons';
import { faComments, faUserFriends, faCalendar } from '@fortawesome/free-solid-svg-icons';

library.add(fab, faComments, faUserFriends, faCalendar);

const Root = () => {
  return (
    <div className="app-container">
      <BrowserRouter>
        <Switch>
          <Route path="/" component={Feed} />
        </Switch>
      </BrowserRouter>
    </div>
  );
};

const rootElement = document.getElementById('root');
ReactDOM.render(<Root />, rootElement);
