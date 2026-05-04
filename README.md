# Restaurant Management System | Salesforce

**Personal Project** | Salesforce Lightning Platform

## Overview
Built a custom Salesforce application to manage restaurant operations including table reservations, menu items, and order processing. Designed 5 custom objects with Lookup and Master-Detail relationships to reflect real-world data hierarchy.

## Objects
- Restaurant Table
- Menu Item
- Order
- Order Item
- Reservation

## Features Implemented

**Price Automation**
Implemented Record-Triggered Flow to automatically populate Unit Price from the related Menu Item upon Order Item creation, eliminating manual data entry errors.

**Subtotal Calculation**
Created Formula Field to calculate Order Item subtotals dynamically based on Quantity x Unit Price.

**Total Amount Calculation**
Configured Roll-Up Summary Field on the Order object to automatically aggregate all Order Item subtotals into a real-time Total Amount.

**Table Status Automation**
Built Apex Trigger using the Trigger + Handler design pattern to update table status in real-time based on order lifecycle:
- New / Preparing / Served → Occupied
- Paid / Cancelled → Available

## Technologies Used
- Apex (Trigger + Handler Pattern)
- Flow Builder (Record-Triggered Flow)
- SOQL
- Formula Fields
- Roll-Up Summary Fields
- Salesforce Lightning Platform

## Key Highlights
- End-to-end order lifecycle automation
- Real-world business logic using Apex
- Data consistency across related objects
- Scalable and reusable architecture
