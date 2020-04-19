import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and foo to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>

    // <SplitPane split="vertical" minSize={50}>
    //   <div />
    //   <SplitPane split="horizontal">
    //     <div />
    //     <div />
    //   </SplitPane>
    // </SplitPane>
  );
}

export default App;
