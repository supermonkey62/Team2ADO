# NWT Modernization Project Overview
This section outlines the key aspects of the NWT modernization project, including their existing reporting requirements, pain points, management goals, and the proposed solution.

## Existing Reporting Requirements
### Sales Overview: 
Analyze overall sales to understand customer preferences, product popularity, and sales performance across different regions.

### Sales Agent Tracking: 
Monitor sales agent performance to adjust commissions and reward high achievers while motivating low performers.

### Supplier Reporting: 
Evaluate supplier relationships by analyzing total orders to potentially negotiate better deals.

### Customer Reporting: 
Provide customers with insights into their purchase orders, helping improve customer care and marketing strategies.

### NWT's Pain Points
Large analytics queries impact transaction system processing speed.
Difficulty in meeting analytical reporting requirements due to slow database performance.
Management Goals for Modernization
NWT aims to modernize its data and reporting infrastructure by moving away from on-premise MySQL databases to a cloud-based solution, with minimal disruption to day-to-day operations. Key goals include:

### Better Scalability: 
Overcoming limitations of on-premises hardware.

### Reduced Load on Operational Systems: 
Moving away from using OLTP for reporting.

### Improved Reporting Speed: 
Addressing delays in daily reporting.

### Enhanced Data Security: 
Implementing better access controls for data and reports.

## Proposed Modernization Solution
The recommended approach for modernizing NWT's systems involves migrating to a fully managed cloud-based data warehouse platform called Snowflake. Here's how the transition will take place:

### Replacement of MySQL: 
On-premise MySQL databases will be replaced with Snowflake.

### OLAP System in Snowflake: 
Setting up an Online Analytical Processing (OLAP) system in Snowflake to support post-migration reporting requirements.

### Migration of Databases: 
All existing MySQL databases will be migrated to Snowflake for reporting purposes.

### Adoption of SnowSQL: 
SnowSQL, a command-line client, will become the primary OLAP solution, replacing the legacy OLTP transactional system.

### Data Warehouse: 
Creating a data warehouse in Snowflake with dimension (dim) and fact tables to facilitate efficient reporting.

This modernization plan aims to address NWT's challenges, improve performance, and provide a scalable and secure platform for their reporting needs.
