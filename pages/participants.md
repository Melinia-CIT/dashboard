---
title: Participant Demographics
---


```sql top_colleges
select * from melinia.top_colleges
```

```sql students_by_degree
select * from melinia.students_by_degree
```

```sql students_by_year
select * from melinia.students_by_year
```

```sql users_by_status
select * from melinia.users_by_status
```

```sql profile_completion
select * from melinia.profile_completion
```

# 👥 Participant Insights

Understanding who is attending Melinia.

<Grid cols=2>
    <BarChart 
        data={top_colleges} 
        x=college_name 
        y=students 
        swapXY=true 
        title="Top Colleges"
    />
    <BarChart 
        data={students_by_degree} 
        x=degree_name 
        y=students 
        swapXY=true 
        title="Distribution by Degree"
    />
</Grid>

## Year of Study

<BarChart 
    data={students_by_year} 
    x=year 
    y=students 
    title="Participants by Year"
/>

## Registration Status

<Grid cols=2>
    <ECharts config={{
    title: {
        text: 'Account Status',
        left: 'center'
    },
    tooltip: {
        trigger: 'item'
    },
    legend: {
        top: 'bottom',
        left: 'center'
    },
    series: [
        {
            name: 'Account Status',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            label: {
                show: false,
                position: 'center'
            },
            emphasis: {
                label: {
                    show: true,
                    fontSize: 20,
                    fontWeight: 'bold'
                }
            },
            labelLine: {
                show: false
            },
            data: users_by_status.map(d => ({ value: d.count, name: d.status }))
        }
    ]
}} />
    <ECharts config={{
    title: {
        text: 'Profile Completion Status',
        left: 'center'
    },
    tooltip: {
        trigger: 'item'
    },
    legend: {
        top: 'bottom',
        left: 'center'
    },
    series: [
        {
            name: 'Profile Completion Status',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            label: {
                show: false,
                position: 'center'
            },
            emphasis: {
                label: {
                    show: true,
                    fontSize: 20,
                    fontWeight: 'bold'
                }
            },
            labelLine: {
                show: false
            },
            data: profile_completion.map(d => ({ value: d.completed, name: d.profile_completed }))
        }
    ]
}} />
</Grid>
