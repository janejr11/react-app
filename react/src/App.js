import React from 'react';
import logo from './logo.svg';
import './App.css';
import SplitPane, { Pane } from 'react-split-pane';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <SplitPane split="vertical" minSize={50}>
          <div>
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
          </div>
          <SplitPane split="horizontal">
            <div>
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
            </div>
            <div>
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
            </div>
          </SplitPane>
        </SplitPane>
      </header>
    </div>


  );
}

export default App;
