<% if get_resource_ivar.errors.any? %>
    <div id="error_explanation">
     <h2><%= pluralize(get_resource_ivar.errors.count, "error") %> prohibited this test_mec from being saved:</h2>

      <ul>
      <% get_resource_ivar.errors.full_messages.each do |msg| %>
        <li><%= msg %></li>
      <% end %>
      </ul>
     </div>

  <% end %>