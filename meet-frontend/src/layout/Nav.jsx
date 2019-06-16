import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faCalendar } from '@fortawesome/free-regular-svg-icons';
import { get } from '../api/utils';
import styled from 'styled-components';

export function Nav(props) {
  const { id } = props.match.params;
  const [user, setUser] = useState(undefined);

  useEffect(() => {
    get(`users/${id}`)
      .then(json => {
        setUser(json.data);
      })
      .catch(e => console.log(e));
  }, []);

  return (
    <Wrapper>
      <div className="logo">
        <Link to={props.match.url}>
          <h1>MEET</h1>
        </Link>
      </div>
      <div className="icons">
        <Link className="link-icon" to={`${props.match.url}/events`}>
          <FontAwesomeIcon icon={faCalendar} />
        </Link>
      </div>
      <div className="avatar">{user ? user.email : ''}</div>
    </Wrapper>
  );
}

const Wrapper = styled.div`
  display: flex;
  margin-bottom: 2rem;

  .logo {
    display: flex;
    align-self: flex-end;
    margin-bottom: -1rem;
  }

  .icons {
    display: flex;
    font-size: 2rem;
    font-weight: bolder;
    margin: 0 0 0.1rem 2rem;
  }

  .link-icon {
    align-self: flex-end;
  }

  .avatar {
    display: flex;
    align-self: flex-end;
    flex: 1 0 auto;
    justify-content: flex-end;
  }
`;
