import React from 'react';
import styled from 'styled-components';

const Wrapper = styled.div`
  .title-container {
    position: relative;
    overflow: hidden;
    .logo {
      font-size: 4rem;
      font-family: 'ManropeBold', sans-serif;
      width: fit-content;
      position: relative;
      display: block;
      transform: translateY(6rem);
      animation: up 500ms linear forwards;
      z-index: 1;
      border-bottom: 1rem solid black;
      .meet {
        margin-bottom: -0.5rem;
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
  }
`;

export function Feed(props) {
  return (
    <Wrapper>
      <div className="title-container">
        <div className="logo">
          <span className="meet">Meet</span>
        </div>
      </div>
    </Wrapper>
  );
}
