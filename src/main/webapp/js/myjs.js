var countre=0;
function add_more_field(){
    document.getElementById("btnadd").disabled = true;
    let s = prompt("Please enter total number of fields");
    let n=parseInt(s);
    
    for(let i=0;i<n;i++){
    countre+=1;
    html=`<div class="row mt-2" id="row`+countre+`">
                      <div class="col-6 form-group">
                          <label>Field Name</label>
                          <input type="text" name="fieldname`+countre+`" class="form-control" placeholder="Enter field name">
                      </div>
                      <div class="col-6 form-group">
                          <label>Field Type</label><br>
                          <select class="form-control" name="fieldtype`+countre+`">
                            <option value="DATETIME">DATE</option>
                            <option value="varchar(255)">String</option>
                            <option value="int">Number</option>
                            <option value="BOOLEAN">BOOLEAN</option>
                            <option value="varchar(51)">Email</option>
                          </select>
                      </div>
                  </div>
`;
    var form = document.getElementById("tableDetails-form");
    form.innerHTML+=html;
}

btn=`<div class="text-center">
                        <button type="submit" class="btn btn-outline-dark mt-4">Create Table</button>
                  </div>`;
    fields=`<div class="row" id="row0">
                      <div class="col-6 form-group">
                          <label>Enter Table Name</label>
                          <input type="text" name="tablename" class="form-control" placeholder="Enter table name">
                      </div>
                      <div class="col-6 form-group">
                          <label>Total number of Fields</label>
                          <input type="text" name="numberfields" class="form-control" value="`+s+`">
                   </div>
             </div>`;
    form.innerHTML+=fields;
    form.innerHTML+=btn;
}
