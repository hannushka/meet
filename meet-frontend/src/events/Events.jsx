import React from 'react';
import { Link } from 'react-router-dom';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faPlusSquare } from '@fortawesome/free-regular-svg-icons';
import styled from 'styled-components';

const Wrapper = styled.div`
  .create-event {
    flex: 1 0 100%;
    border: 1px solid #ede8e8;
    padding: 0.8rem 0.4rem;
    box-shadow: 0.1rem 0.1rem 0.1rem #ede8e8;
    border-radius: 0.2rem;

    * {
      margin: 0 0.4rem;
    }
  }
`;

export function Events(props) {
  return (
    <Wrapper>
      <Link to={props.match.url}>
        <div className="create-event">
          <FontAwesomeIcon icon={faPlusSquare} />
          Create event
        </div>
      </Link>
    </Wrapper>
  );
}
