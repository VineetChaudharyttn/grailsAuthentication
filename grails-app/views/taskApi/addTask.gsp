<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>

<body>

<div class="card">

    <div class="card-header">

        <h1>
            Add Task
        </h1>
    </div>

    <form name="RegisterTaskfrom" ng-submit="RegisterTask();">

        <div class="card-body ">
            <table>
                <tr>
                    <td>
                        Date:
                    </td>
                    <td>
                        <input type="date" ng-model="task.date"  min="{{date | date:'yyyy-MM-dd'}}" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        Title:
                    </td>
                    <td>
                        <input type="text" ng-model="task.title" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        Task:
                    </td>
                    <td>
                        <input type="text" ng-model="task.task" required>
                    </td>
                </tr>
            </table>
        </div>

        <div class="card-footer">
            <input type="submit" class="btn btn-primary"  value="submit" ng-disabled="RegisterTaskfrom.$invalid">

            <a href="#/" class="btn btn-primary">Back</a>
        </div>
    </form>

</div>

</body>
</html>