import React, { useState, useEffect } from 'react';
import styled from 'styled-components';
import { Logo } from './Logo';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';

const Wrapper = styled.div`
  display: flex;
  .nav {
    display: flex;
    flex: 1 0 auto;
    justify-content: space-between;
    margin: 0 4rem;
    .nav-items {
      display: flex;
      cursor: pointer;
      margin-bottom: -1.75rem;
      .nav-item {
        margin: 0 1rem;
        align-self: center;
        transition: all 0.2s ease-in-out;
      }
      .nav-item:hover {
        transform: scale(1.05);
      }
    }

    .avatar {
      height: 6rem;
      width: 6rem;
      border-radius: 100%;
      background: black;
      cursor: pointer;
    }
    .avatar:hover {
      transform: scale(1.05);
    }
  }
`;

const NotificationWrapper = styled.div`
  width: 0.9rem;
  height: 0.9rem;
  background: black;
  position: absolute;
  border-radius: 100%;
  top: -0.2rem;
  left: 0.9rem;
  animation: 0.5s blinker 1;

  @keyframes blinker {
    50% {
      opacity: 0;
    }
  }
`;

export function Nav(props) {
  // const { id } = props.match.params;
  // const [user, setUser] = useState(undefined);

  // useEffect(() => {
  //   get(`users/${id}`)
  //     .then(json => {
  //       setUser(json.data);
  //     })
  //     .catch(e => console.log(e));
  // }, []);

  return (
    <Wrapper>
      <Logo />
      <div className="nav">
        <div className="nav-items">
          <FontAwesomeIcon className="nav-item" icon="user-friends" size="3x" />
          <FontAwesomeIcon className="nav-item" icon="comments" size="3x" />
          <FontAwesomeIcon className="nav-item" icon="calendar" size="3x" />
        </div>
        <div className="avatar" />
      </div>
    </Wrapper>
  );
}
