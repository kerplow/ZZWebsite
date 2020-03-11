class AutoTable extends HTMLElement {
  constructor () {
    super();
    var shadow = this.attachShadow({mode: 'open'});

    var columns = this.getAttribute('columns');
    var rows = this.getAttribute('rows');

    var style = document.createElement('style');
    style.textContent = `
      .table {
        height: 320px;
        display: grid;
        grid-template-columns: [header] 8rem repeat(${columns}, [task] 1fr );
        grid-template-rows: [task-names] 8rem repeat(${rows}, [week] 1fr );
        gap: 0px 0px;

        .table-row {

          .row-header {

          }

          .cell {

          }
        }
      }
    `;

    var table_template = document.getElementById('auto-table')

    shadow.appendChild(table_template.cloneNode(true))
  };

  connectedCallback() {
    console.log('worked');
  };

  disconnectedCallback() {
    console.log('ciao');
  };
}

window.customElements.define("auto-table", AutoTable)
