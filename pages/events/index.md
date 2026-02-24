---
title: Event Explorer
---

# 🎯 Event Explorer

Explore detailed information about all events, rounds, and prizes.

```sql event_types
select * from melinia.event_types
```

```sql events_detailed
select * from melinia.events_detailed
```

```sql all_event_rounds
select * from melinia.all_event_rounds
```

```sql all_event_prizes
select * from melinia.all_event_prizes
```

<Dropdown
    data={event_types}
    name=type_filter
    value=event_type
    title="Filter by Event Type"
    defaultValue="All"
    emptyLabel="All Types"
/>

<DataTable data={events_detailed.filter(d => inputs.type_filter === 'All' || d.event_type === inputs.type_filter)}>
    <Column id=name title="Event Name" />
    <Column id=event_type title="Type" />
    <Column id=participation_type title="Participation" />
    <Column id=registrations title="Registrations" />
    <Column id=total_prize_pool title="Prize Pool" fmt="inr0" />
    <Column id=round_count title="Rounds" />
</DataTable>

---

## 🕒 Round Schedule

<DataTable data={all_event_rounds.filter(d => inputs.type_filter === 'All' || d.event_type === inputs.type_filter)}>
    <Column id=event_name title="Event" />
    <Column id=round_no title="#" />
    <Column id=round_name title="Round Name" />
    <Column id=start_time title="Start" fmt="mmm d, h:mm a" />
    <Column id=end_time title="End" fmt="mmm d, h:mm a" />
</DataTable>

---

## 🏆 Prize Distribution

<BarChart 
    data={all_event_prizes} 
    x=event_name 
    y=reward_value 
    series=position
    title="Prizes by Event and Position"
    stack=true
    yFmt="inr0"
/>
