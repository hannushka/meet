import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
  position: relative;
  overflow: hidden;
  .logo {
    cursor: pointer;
    font-size: 4rem;
    font-family: 'ManropeBold', sans-serif;
    width: fit-content;
    position: relative;
    display: block;
    transform: translateY(6rem);
    animation: up 500ms linear forwards;
    z-index: 1;
    border-bottom: 0.5rem solid black;
    .meet {
      margin-bottom: -1rem;
      display: block;
    }
    &::before,
    &::after {
      position: absolute;
      content: '';
      width: 0px;
      height: 1px;
      left: 0;
      background-color: rgba(0, 0, 0, 0.2);
      z-index: -1;
    }
  }

  @keyframes up {
    100% {
      transform: translateY(0);
    }
  }

  @keyframes draw {
    100% {
      width: 100%;
    }
  }
`;

export function Logo(props) {
  return (
    <Wrapper className="title-container">
      <div className="logo">
        <a href="/" className="meet">
          Meet
        </a>
      </div>
    </Wrapper>
  );
}
