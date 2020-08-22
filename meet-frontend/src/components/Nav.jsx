import React, { useState, useEffect } from 'react';
import styled from 'styled-components';
import { Logo } from './Logo';

const Wrapper = styled.div`
  .nav {
    display: flex;
    justify-content: space-around;
    .avatar {
      height: 6rem;
      width: 6rem;
      border-radius: 100%;
      background: black;
    }
    .nav-items {
      display: flex;
      color: #787878;
      .nav-item-wrapper {
        position: relative;
        margin-bottom: 1rem;
        .notification {
          width: 0.9rem;
          height: 0.9rem;
          background: black;
          position: absolute;
          border-radius: 100%;
          top: -0.2rem;
          left: 0.9rem;
          animation: 0.5s blinker 1;
        }
      }
    }

    @keyframes blinker {
      50% {
        opacity: 0;
      }
    }
  }
`;

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
      <Logo />
      <div className="nav">
        <div className="nav-items">
          <div className="nav-item-wrapper">
            <i className="material-icons">people_outline</i>
          </div>
          <div className="nav-item-wrapper">
            <i className="material-icons">forum</i>
            <span className="notification" />
          </div>
          <div className="nav-item-wrapper">
            <i className="material-icons">calendar_today</i>
          </div>
        </div>
        <div className="avatar" />
      </div>
    </Wrapper>
  );
}
