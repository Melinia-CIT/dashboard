---
title: Melinia Dashboard
description: Interactive analytics dashboard for the Melinia event management platform
---


```sql user_summary
select * from melinia.user_summary
```

```sql payment_summary
select * from melinia.payment_summary
```

```sql team_summary
select * from melinia.team_summary
```

```sql checkin_summary
select * from melinia.checkin_summary
```

```sql user_registrations_over_time
select * from melinia.user_registrations_over_time
```

```sql users_by_role
select * from melinia.users_by_role
```

```sql users_by_status
select * from melinia.users_by_status
```

```sql users_by_payment_status
select * from melinia.users_by_payment_status
```

```sql profile_completion
select * from melinia.profile_completion
```

```sql top_colleges
select * from melinia.top_colleges
```

```sql students_by_degree
select * from melinia.students_by_degree
```

```sql students_by_year
select * from melinia.students_by_year
```

```sql events_by_type
select * from melinia.events_by_type
```

```sql event_registrations_summary
select * from melinia.event_registrations_summary
```

```sql registrations_over_time
select * from melinia.registrations_over_time
```

```sql events_overview
select * from melinia.events_overview
```

```sql payments_by_status
select * from melinia.payments_by_status
```

```sql revenue_over_time
select * from melinia.revenue_over_time
```

```sql invitations_by_status
select * from melinia.invitations_by_status
```

```sql coupon_summary
select * from melinia.coupon_summary
```

```sql checkins_over_time
select * from melinia.checkins_over_time
```

```sql event_round_checkins_summary
select * from melinia.event_round_checkins_summary
```

```sql round_results_by_event
select * from melinia.round_results_by_event
```

```sql event_results_summary
select * from melinia.event_results_summary
```

# 🎪 Melinia Dashboard

<Alert status="info">
    Live data from the Melinia event management platform database.
</Alert>

## Overview

<Grid cols=4>
    <BigValue
        data={user_summary}
        value=total_users
        title="Total Users"
        fmt="num0"
    />
    <BigValue
        data={payment_summary}
        value=total_paid_users
        title="Total Paid Users"
        fmt="num0"
    />
    <BigValue
        data={team_summary}
        value=total_teams
        title="Total Teams"
        fmt="num0"
    />
    <BigValue
        data={checkin_summary}
        value=total_checkins
        title="Total Check-ins"
        fmt="num0"
    />
</Grid>

---

## 👥 Users

### Registration Trend

<LineChart
    data={user_registrations_over_time}
    x=registration_date
    y=cumulative_users
    yAxisTitle="Total Users"
    title="Cumulative User Registrations"
    xFmt="mmm d"
/>

<LineChart
    data={user_registrations_over_time}
    x=registration_date
    y=new_users
    yAxisTitle="New Users"
    title="Daily New Registrations"
    xFmt="mmm d"
    chartType=bar
/>

### User Breakdown

<Grid cols=1>
    <ECharts config={{
    title: {
        text: 'By Role',
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
            name: 'By Role',
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
            data: users_by_role.map(d => ({ value: d.count, name: d.role }))
        }
    ]
}} />
    <ECharts config={{
    title: {
        text: 'By Status',
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
            name: 'By Status',
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
        text: 'By Payment Status',
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
            name: 'By Payment Status',
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
            data: users_by_payment_status.map(d => ({ value: d.count, name: d.payment_status }))
        }
    ]
}} />
</Grid>

### Profile Completion

<Grid cols=3>
    <BigValue
        data={profile_completion}
        value=completed
        title="Profiles Completed"
        fmt="num0"
    />
    <BigValue
        data={profile_completion}
        value=not_completed
        title="Profiles Pending"
        fmt="num0"
    />
    <BigValue
        data={profile_completion}
        value=completion_rate
        title="Completion Rate"
        fmt="pct1"
    />
</Grid>

---

## 🎓 Student Demographics

<Grid cols=1>
    <BarChart
        data={top_colleges}
        x=college_name
        y=students
        title="Top 20 Colleges"
        swapXY=true
        sort=true
    />
    <BarChart
        data={students_by_degree}
        x=degree_name
        y=students
        title="Students by Degree"
        swapXY=true
        sort=true
    />
</Grid>

<BarChart
    data={students_by_year}
    x=year
    y=students
    title="Students by Year of Study"
/>

---

## 🎯 Events

### Events by Type

<Grid cols=1>
    <ECharts config={{
    title: {
        text: 'Event Type Distribution',
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
            name: 'Event Type Distribution',
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
            data: events_by_type.map(d => ({ value: d.count, name: d.event_type }))
        }
    ]
}} />
    <DataTable
        data={events_by_type}
        rows=10
    >
        <Column id=event_type title="Event Type" />
        <Column id=count title="Count" />
    </DataTable>
</Grid>

### Event Registrations

<BarChart
    data={event_registrations_summary}
    x=event_name
    y=registrations
    title="Registrations vs Capacity by Event"
    swapXY=true
    sort=true
/>

<BarChart
    data={event_registrations_summary}
    x=event_name
    y=fill_rate
    title="Event Fill Rate (%)"
    swapXY=true
    sort=true
    yFmt="num1"
/>

### Registration Trend

<BarChart
    data={registrations_over_time}
    x=reg_date
    y=registrations
    title="Event Registrations Over Time"
    xFmt="mmm d"
/>

### All Events

<DataTable
    data={events_overview}
    rows=10
    search=true
>
    <Column id=name title="Event" />
    <Column id=event_type title="Type" />
    <Column id=participation_type title="Mode" />
    <Column id=registrations title="Registrations" />
    <Column id=max_allowed title="Max Allowed" />
    <Column id=venue title="Venue" />
    <Column id=start_time title="Start" fmt="mmm d, h:mm a" />
    <Column id=end_time title="End" fmt="mmm d, h:mm a" />
</DataTable>

---

## 💰 Payments & Revenue

<Grid cols=4>
    <BigValue
        data={payment_summary}
        value=total_payments
        title="Total Payments"
        fmt="num0"
    />
    <BigValue
        data={payment_summary}
        value=successful_payments
        title="Successful"
        fmt="num0"
    />
    <BigValue
        data={payment_summary}
        value=total_paid_users
        title="Total Paid Users"
        fmt="num0"
    />
    <BigValue
        data={payment_summary}
        value=avg_payment
        title="Avg Payment"
        fmt="inr2"
    />
</Grid>

<Grid cols=1>
    <ECharts config={{
    title: {
        text: 'Payments by Status',
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
            name: 'Payments by Status',
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
            data: payments_by_status.map(d => ({ value: d.count, name: d.payment_status }))
        }
    ]
}} />
    <BarChart
        data={payments_by_status}
        x=payment_status
        y=total_amount
        title="Amount by Payment Status"
        yFmt="inr0"
    />
</Grid>

### Revenue Over Time

<LineChart
    data={revenue_over_time}
    x=payment_date
    y=cumulative_paid_users
    yAxisTitle="Cumulative Paid Users"
    title="Cumulative Paid Users"
    xFmt="mmm d"
/>

<BarChart
    data={revenue_over_time}
    x=payment_date
    y=paid_users
    title="Daily Paid Users"
    xFmt="mmm d"
/>

---

## 👥 Teams & Invitations

<Grid cols=3>
    <BigValue
        data={team_summary}
        value=total_teams
        title="Total Teams"
        fmt="num0"
    />
    <BigValue
        data={team_summary}
        value=avg_team_size
        title="Avg Team Size"
        fmt="num1"
    />
    <BigValue
        data={team_summary}
        value=max_team_size
        title="Max Team Size"
        fmt="num0"
    />
</Grid>

<ECharts config={{
    title: {
        text: 'Invitation Status Distribution',
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
            name: 'Invitation Status Distribution',
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
            data: invitations_by_status.map(d => ({ value: d.count, name: d.invitation_status }))
        }
    ]
}} />

---

## 🎟️ Coupons

<Grid cols=3>
    <BigValue
        data={coupon_summary}
        value=total_coupons
        title="Total Coupons"
        fmt="num0"
    />
    <BigValue
        data={coupon_summary}
        value=redeemed
        title="Redeemed"
        fmt="num0"
    />
    <BigValue
        data={coupon_summary}
        value=available
        title="Available"
        fmt="num0"
    />
</Grid>

---

## ✅ Operations

### Check-ins

<Grid cols=2>
    <BigValue
        data={checkin_summary}
        value=total_checkins
        title="Total Check-ins"
        fmt="num0"
    />
    <BigValue
        data={checkin_summary}
        value=unique_participants
        title="Unique Participants"
        fmt="num0"
    />
</Grid>

<BarChart
    data={checkins_over_time}
    x=checkin_hour
    y=checkins
    title="Check-ins Over Time"
    xFmt="mmm d, h a"
/>

### Event Round Check-ins

<DataTable
    data={event_round_checkins_summary}
    rows=15
    search=true
>
    <Column id=event_name title="Event" />
    <Column id=round_no title="Round #" />
    <Column id=round_name title="Round Name" />
    <Column id=round_checkins title="Check-ins" />
</DataTable>

### Round Results

<BarChart
    data={round_results_by_event}
    x=event_name
    y=count
    series=status
    title="Round Results by Event"
    type=stacked
    swapXY=true
/>

### Event Results & Prizes

<DataTable
    data={event_results_summary}
    rows=15
    search=true
>
    <Column id=event_name title="Event" />
    <Column id=total_winners title="Winners" />
    <Column id=total_prize_value title="Prize Value" fmt="inr0" />
    <Column id=total_points title="Total Points" />
</DataTable>
