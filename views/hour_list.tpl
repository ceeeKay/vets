%rebase ('layout.tpl')

<form method="POST" action="/hours">
    Name <select name="volunteer_id">
      <option value="">All Volunteers</option>
      %for val in volunteers:
        %if volunteer_id == str(val["id"]):
          <option value={{val["id"]}} selected>{{val["name"]}}</option>
        %else:
          <option value={{val["id"]}}>{{val["name"]}}</option>
        %end
      %end
    </select>
    From <input type="date" name="start" value="{{start}}">
    To <input type="date" name="end" value="{{end}}">
    Sum <select name="group_by">
      <option value="">None</option>
      %if group_by == 'volunteer':
        <option value="volunteer" selected>Volunteer</option>
      %else:
        <option value="volunteer">Volunteer</option>
      %end
      %if group_by == 'activity':
        <option value="activity" selected>Activity</option>
      %else:
        <option value="activity">Activity</option>
      %end
    </select>
    <input type="submit" value="Report" />
    <a href="/hours"><input type="button" value="Clear"/></a>
  </tr></table>
</form>

</br>

%if group_by == '':
<table border="0">
  <th>Name</th>
  <th>Activity</th>
  <th>Checked In</th>
  <th>Checked Out</th>
  <th>Hours</th>
  <th></th>
  <th></th>
  %for idx, row in enumerate(rows):
    %if idx % 2:
      <tr class="highlight">
    %else:
      <tr>
    %end
        <td>{{row['volunteer']}}</td>
        <td>{{row['activity']}}</td>
        <td>{{row['strftime(\'%m/%d/%Y %H:%M\',start)']}}</td>
        <td>{{row['strftime(\'%m/%d/%Y %H:%M\',end)']}}</td>
        <td>{{row['totalHours']}}</td>
        <td><a href="/checkout/{{row['id']}}">Edit</a></td>
        <td><a href="/hours/{{row['id']}}/delete">Delete</a></td>
      </tr>
  %end
</table>
%else:
<table border="0">
  <th>Name</th>
  <th>Hours</th>
  %for idx, row in enumerate(rows):
    %if idx % 2:
      <tr class="highlight">
    %else:
      <tr>
    %end
      %if group_by == 'volunteer':
        <td>{{row['volunteer']}}</td>
      %elif group_by == 'activity':
        <td>{{row['activity']}}</td>
      %end      
        <td>{{row['totalHours']}}</td>
      </tr>
  %end
</table>
%end
