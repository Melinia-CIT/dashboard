---
title: Finance Analytics
---


```sql payment_summary
select * from melinia.payment_summary
```

```sql revenue_over_time
select * from melinia.revenue_over_time
```

```sql payments_by_status
select * from melinia.payments_by_status
```

```sql coupon_summary
select * from melinia.coupon_summary
```

# 💰 Finance & Revenue

Detailed breakdown of payments, coupons, and revenue streams.

<Grid cols=2>
    <BigValue 
        data={payment_summary} 
        value=total_revenue 
        title="Gross Revenue" 
        fmt="inr0"
    />
    <BigValue 
        data={payment_summary} 
        value=successful_payments 
        title="Successful Transactions"
    />
</Grid>

## Revenue over Time

<LineChart 
    data={revenue_over_time} 
    x=payment_date 
    y=revenue 
    title="Daily Revenue"
    yFmt="inr0"
/>

## Payment Status Breakdown

<Grid cols=2>
    <BarChart 
        data={payments_by_status} 
        x=payment_status 
        y=count 
        title="Volume by Status"
    />
    <BarChart 
        data={payments_by_status} 
        x=payment_status 
        y=total_amount 
        title="Value by Status"
        yFmt="inr0"
    />
</Grid>

## Coupon Performance

<Grid cols=3>
    <BigValue data={coupon_summary} value=total_coupons title="Total Coupons" />
    <BigValue data={coupon_summary} value=redeemed title="Redeemed" />
    <BigValue data={coupon_summary} value=available title="Available" />
</Grid>

<DataTable data={payments_by_status}>
    <Column id=payment_status title="Status" />
    <Column id=count title="Trans. Count" />
    <Column id=total_amount title="Total Amount" fmt="inr0" />
</DataTable>
