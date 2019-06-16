import React from 'react';
import styled from 'styled-components';

export function Sidebar() {
  return <Bar />;
}

const Bar = styled.div`
  background: #f7f7f7;
  position: absolute;
  width: 25%;
  height: 100%;
  top: 0;
  right: 0;
`;
