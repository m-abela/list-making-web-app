<html lang="en">
<!--this is the jsp for being able to create the lists-->
<head>
    <meta charset="UTF-8">
    <title>List</title>
    <jsp:include page="meta.jsp"/>
    <jsp:include page="sidebar.jsp"/>
</head>
<body>
<div class="container">
  <h1 class="text-center mt-4 mb-5">Make Your List Here</h1>
  <div class="row justify-content-center">
    <div class="col-md-6">
      <form method="post" action="/savelist" enctype="application/x-www-form-urlencoded">
        <div class="form-group">
          <label for="title" class="mb-2">Title</label>
          <input type="text" class="form-control" name="title" id="title" placeholder="Enter the title"/>
        </div>
        <div class="form-group">
          <label for="index" class="mb-2">Index</label>
          <input type="text" class="form-control" name="index" id="index" placeholder="Enter the index"/>
        </div>
        <div class="form-group">
          <label for="items" class="mb-2">Items</label>
          <small class="text-muted d-block mb-2">Click add button to add items.</small>
          <div class="input-group mb-3">
            <input type="text" class="form-control" name="item" id="item" placeholder="Enter item">
            <button class="btn btn-outline-secondary" type="button" id="add-btn">Add</button>
          </div>
          <ul class="list-group" id="item-list">


            </li>
          </ul>
        </div>
        <button type="submit" class="btn btn-primary mt-3">Save</button>
      </form>
    </div>
  </div>
  <div id="notes" class="row container-fluid"></div>
</div>
<script>
  document.getElementById('add-btn').addEventListener('click', addItem);

  function addItem() {
    var itemInput = document.getElementById('item');
    var itemList = document.getElementById('item-list');
    var newItem = document.createElement('li');
    newItem.setAttribute('class', 'list-group-item d-flex justify-content-between align-items-center');
    newItem.innerHTML = itemInput.value + '<input type="hidden" name="item[]" value="' + itemInput.value + '">' +
      '<button class="btn btn-danger btn-sm remove-btn">&times;</button>';
    itemList.appendChild(newItem);
    itemInput.value = '';
    var removeButtons = document.getElementsByClassName('remove-btn');
    for (var i = 0; i < removeButtons.length; i++) {
      removeButtons[i].addEventListener('click', removeItem);
    }
  }
  function removeItem() {
    this.parentElement.remove();
  }
</script>
</body>
</html>
