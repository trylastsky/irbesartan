import React from 'react';
import './App.css';



function App() {
  return (
    <div className="App">
      <header className="App-header">
        <button className='glow-on-hover' type='button' id='buttonLk'> Личный Кабинет</button>
      </header>
      <div className='main'>

      </div>
      <footer>
        <p>©Trylastsky for World skills Russia</p>
      </footer>
    </div>
  );
}

class TabContent extends React.Component {
  render() {
    const { title, content } = this.props;

    return (
      <div className="tabcontent">
        <h3>{title}</h3>
        <p>{content}</p> 
      </div>
    );
  }
}

class Tabs extends React.Component {
  state = {
    active: null,
  }

  openTab = e => this.setState({
    active: +e.target.dataset.index,
  });

  render() {
    const { items } = this.props;
    const { active } = this.state;

    return (
      <div>
        <div className="tab">
          {items.map((n, i) => (
            <button
              className={`tablinks ${i === active ? 'active' : ''}`}
              onClick={this.openTab}
              data-index={i}
            >{n.title}</button>
          ))}
        </div>
        {items[active] && <TabContent {...items[active]} />}
      </div>
    );
  }
}

export default App;
