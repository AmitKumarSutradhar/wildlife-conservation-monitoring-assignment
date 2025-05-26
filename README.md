## ১. PostgreSQL কী?
- PostgreSQL এডভান্স, এন্টারপ্রাইজ লেভেল এবং রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম। PostgreSQL একটি ওপেনসোর্স ডাটাবেস ম্যানেজমেন্ট সিস্টেম।

- PostgreSQL এর অন্যান্য রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম এর মত এডভান্স অনেক ফিচার আছে। যেমনঃ 
  - ইউজার ডিফাইন ডাটা টাইপ।
  - টেবিল ইনহেরিটেন্স।
  - ফরেন কী রেফারেন্সিয়াল ইন্টিগ্রেটি।
  - মাল্টি-ভার্সন কনকারেন্সি কন্ট্রোল। 
  - এসিনক্রোনাস রেপ্লিকেশন।   
  - JSON, XML এর মতো স্ট্রাকচারড ডেটা সাপোর্ট করে। 


## ২. Primary Key এবং Foreign Key-এর পার্থক্য কী? 
 - রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেমে Primary Key এবং Foreign Key দুটি ইম্পর্টেন্ট কনসেপ্ট। Primary Key এবং Foreign Key এর উপর ভিত্তি করে মূলত একাধিক টেবিলের মধ্যে রিলেশন করা হয়।

- Primary Key - Primary Key হলো একটি  টেবিলের রো কে ইউনিক ভাবে Identify করে। Primary Key নিশ্চিত করে যে একটি রো এর মধ্যে একাধিক সেইম identifier নেই এবং কোন নাল ভ্যালু ধারন করেনা।   
- Foreign Key -  Foreign Key হলো একটি টেবিলের এমন একটি কলাম যা অন্য একটি টেবিলের  Primary Key নির্দেশ করে এবং ঐ টেবিলের সাথে রিলেশন সৃষ্টি করে।  


## ৩. VARCHAR ও CHAR এর পার্থক্য কী?
- CHAR এবং VARCHAR হচ্ছে দুটি SQL ডেটা টাইপ যা ক্যারেক্টার স্টোর করে। 

- VARCHAR (Variable Character): এটি একটি Variable Length টেক্সট ডেটা টাইপ। যতটুকু ক্যারেক্টার রাখা হয়, ততটুকুই জায়গা নেবে।

উদাহরণ: VARCHAR(100) হলে যদি ৫ ক্যারেক্টার রাখা হয় শুধু ৫ ক্যারেক্টারের জায়গা নেবে।

- CHAR (Character): এটি নির্দিষ্ট Length টেক্সট ডেটা টাইপ। এটি সবসময় ফিক্সড Length নেয়, কম হলে প্যাড করে দেয়।

উদাহরণ: CHAR(10) দিলে ৫ ক্যারেক্টার থাকলেও বাকি ৫টা স্পেস দিয়ে পূর্ণ করবে। 


## ৪. LIMIT এবং OFFSET clauses কেন ব্যবহার হয়?
- LIMIT এবং OFFSET clauses একটি কুয়েরি থেকে স্পেসিফিক portion রেজাল্ট বের করতে ব্যবহার হয়। মূলত pagination এবং chunk ডাটা পেতে LIMIT এবং OFFSET clauses হেল্প করে।
- LIMIT: একটি কুয়ারি থেকে কতগুলো রেকর্ড দেখানো হবে সেটি ডিফাইন করে LIMIT clauses।

উদাহরণঃ

```sql
SELECT * FROM employees ORDER BY id LIMIT 10;
```

- OFFSET: কোন কুয়েরি থেকে কতগুলো রেকর্ড বাদ দিয়ে শুরু হবে সেটি সেটি ডিফাইন করা হয় OFFSET clauses দিয়ে। 

উদাহরণঃ
```sql
SELECT * FROM employees ORDER BY id LIMIT 10 OFFSET 10;
```


## ৫. PostgreSQL-এ COUNT(), SUM(), AVG() এর মতো aggregate function কীভাবে কাজ করে?

- Aggregate function গুলো মূলত একাধিক রো এর উপর mathemetical calculation পারফর্ম করে এবং একটি রো হিসেবে ফলাফল রির্টান করে। 

- ১ - COUNT() →  COUNT() aggregate function মূলত কতগুলো রেকর্ড আছে তা ক্যালকুলেশন করে।

উদাহরণঃ
```sql
SELECT COUNT(*) FROM students;
```

- ২ - SUM() → SUM() aggregate function নির্দিষ্ট একটি কলামের মোট যোগফল রির্টান করে। 

উদাহরণঃ
```sql
SELECT SUM(salary) FROM employees;
```

- ৩ - AVG() → AVG() aggregate function নির্দিষ্ট একটি কলামের average মান  রির্টান করে।  

উদাহরণঃ
```sql
SELECT AVG(age) FROM users; 
```