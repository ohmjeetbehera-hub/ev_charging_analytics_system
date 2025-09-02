DROP TABLE IF EXISTS charging_sessions;
DROP TABLE IF EXISTS vehicles;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS stations;


CREATE TABLE stations (
  station_id    VARCHAR(10) PRIMARY KEY,
  location      VARCHAR(100) NOT NULL,
  capacity_kwh  INT NOT NULL,
  installation_date DATE NOT NULL
);

CREATE TABLE users (
  user_id           VARCHAR(10) PRIMARY KEY,
  name              VARCHAR(100) NOT NULL,
  subscription_type VARCHAR(20)  NOT NULL CHECK (subscription_type IN ('Monthly','Pay-per-use'))
);

CREATE TABLE vehicles (
  vehicle_id       VARCHAR(10) PRIMARY KEY,
  user_id          VARCHAR(10) NOT NULL REFERENCES users(user_id),
  vehicle_type     VARCHAR(10) NOT NULL CHECK (vehicle_type IN ('2W','4W','Bus')),
  battery_capacity INT NOT NULL
);

CREATE TABLE charging_sessions (
  session_id       VARCHAR(12) PRIMARY KEY,
  station_id       VARCHAR(10) NOT NULL REFERENCES stations(station_id),
  vehicle_id       VARCHAR(10) NOT NULL REFERENCES vehicles(vehicle_id),
  start_time       TIMESTAMP NOT NULL,
  end_time         TIMESTAMP NOT NULL,
  energy_used_kwh  DECIMAL(6,2) NOT NULL CHECK (energy_used_kwh > 0),
  cost             DECIMAL(8,2) NOT NULL CHECK (cost >= 0)
);

-- Helpful indexes for analytics
CREATE INDEX idx_sessions_station ON charging_sessions(station_id);
CREATE INDEX idx_sessions_vehicle ON charging_sessions(vehicle_id);
CREATE INDEX idx_sessions_start_time ON charging_sessions(start_time);

-- Sample data
-- Stations
INSERT INTO stations (station_id, location, capacity_kwh, installation_date) VALUES ('ST01', 'Bhubaneswar', 600, '2023-01-01');
INSERT INTO stations (station_id, location, capacity_kwh, installation_date) VALUES ('ST02', 'Cuttack', 400, '2023-05-15');
INSERT INTO stations (station_id, location, capacity_kwh, installation_date) VALUES ('ST03', 'Rourkela', 350, '2024-02-10');
INSERT INTO stations (station_id, location, capacity_kwh, installation_date) VALUES ('ST04', 'Sambalpur', 300, '2024-08-01');
INSERT INTO stations (station_id, location, capacity_kwh, installation_date) VALUES ('ST05', 'Berhampur', 250, '2024-11-20');
-- Users
INSERT INTO users (user_id, name, subscription_type) VALUES ('U01', 'Ravi', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U02', 'Priya', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U03', 'Aman', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U04', 'Neha', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U05', 'Kunal', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U06', 'Shruti', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U07', 'Vivek', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U08', 'Ananya', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U09', 'Rahul', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U10', 'Isha', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U11', 'Arjun', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U12', 'Meera', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U13', 'Rohit', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U14', 'Diya', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U15', 'Samar', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U16', 'Kriti', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U17', 'Yash', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U18', 'Pooja', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U19', 'Kiran', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U20', 'Ishan', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U21', 'Gopal', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U22', 'Tara', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U23', 'Ankit', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U24', 'Ritika', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U25', 'Saanvi', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U26', 'Kabir', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U27', 'Rekha', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U28', 'Dev', 'Pay-per-use');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U29', 'Maya', 'Monthly');
INSERT INTO users (user_id, name, subscription_type) VALUES ('U30', 'Nitin', 'Monthly');
-- Vehicles
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V01', 'U01', '2W', 20);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V02', 'U02', '4W', 60);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V03', 'U03', '4W', 75);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V04', 'U04', '4W', 75);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V05', 'U05', '2W', 20);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V06', 'U06', '4W', 60);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V07', 'U07', '4W', 40);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V08', 'U08', '2W', 18);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V09', 'U09', '4W', 40);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V10', 'U10', '4W', 40);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V11', 'U11', '2W', 20);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V12', 'U12', '4W', 60);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V13', 'U13', '2W', 20);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V14', 'U14', '2W', 20);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V15', 'U15', '4W', 40);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V16', 'U16', '4W', 50);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V17', 'U17', '4W', 50);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V18', 'U18', '2W', 20);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V19', 'U19', '2W', 22);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V20', 'U20', '4W', 50);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V21', 'U21', '4W', 40);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V22', 'U22', '2W', 18);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V23', 'U23', '4W', 75);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V24', 'U24', '2W', 18);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V25', 'U25', '4W', 60);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V26', 'U26', '2W', 20);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V27', 'U27', '2W', 22);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V28', 'U28', '4W', 60);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V29', 'U29', '2W', 22);
INSERT INTO vehicles (vehicle_id, user_id, vehicle_type, battery_capacity) VALUES ('V30', 'U30', '4W', 60);
-- Charging Sessions
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0001', 'ST04', 'V29', '2025-08-01 18:40:00', '2025-08-02 00:54:00', 44.9, 718.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0002', 'ST02', 'V17', '2025-08-01 21:10:00', '2025-08-02 02:39:00', 39.58, 712.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0003', 'ST02', 'V21', '2025-08-01 11:45:00', '2025-08-01 14:40:00', 21.01, 378.18);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0004', 'ST05', 'V15', '2025-08-01 14:00:00', '2025-08-01 18:31:00', 32.59, 586.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0005', 'ST05', 'V25', '2025-08-01 14:40:00', '2025-08-01 17:05:00', 17.45, 314.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0006', 'ST02', 'V15', '2025-08-01 06:30:00', '2025-08-01 10:05:00', 25.8, 464.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0007', 'ST01', 'V28', '2025-08-01 15:20:00', '2025-08-01 18:11:00', 20.58, 370.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0008', 'ST02', 'V18', '2025-08-01 06:40:30', '2025-08-01 07:36:30', 6.76, 108.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0009', 'ST03', 'V29', '2025-08-01 15:20:00', '2025-08-01 17:28:00', 15.39, 246.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0010', 'ST05', 'V03', '2025-08-01 08:50:00', '2025-08-01 14:57:00', 44.14, 794.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0011', 'ST05', 'V25', '2025-08-01 10:15:30', '2025-08-01 16:12:30', 42.93, 772.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0012', 'ST02', 'V09', '2025-08-01 19:20:00', '2025-08-02 00:01:00', 33.81, 608.58);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0013', 'ST04', 'V22', '2025-08-01 17:50:30', '2025-08-01 19:19:30', 10.72, 171.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0014', 'ST02', 'V03', '2025-08-01 16:00:00', '2025-08-01 20:01:00', 28.95, 521.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0015', 'ST01', 'V03', '2025-08-01 07:20:00', '2025-08-01 13:04:00', 41.31, 743.58);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0016', 'ST03', 'V03', '2025-08-01 13:30:30', '2025-08-01 15:29:30', 14.36, 258.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0017', 'ST02', 'V24', '2025-08-01 21:20:30', '2025-08-02 02:32:30', 37.49, 599.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0018', 'ST02', 'V04', '2025-08-01 09:45:30', '2025-08-01 12:52:30', 22.52, 405.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0019', 'ST04', 'V28', '2025-08-01 07:10:00', '2025-08-01 10:10:00', 21.7, 390.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0020', 'ST03', 'V26', '2025-08-01 09:20:00', '2025-08-01 11:11:00', 13.42, 214.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0021', 'ST04', 'V05', '2025-08-01 19:15:30', '2025-08-01 22:35:30', 24.04, 384.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0022', 'ST01', 'V15', '2025-08-01 09:00:00', '2025-08-01 15:04:00', 43.79, 788.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0023', 'ST02', 'V06', '2025-08-01 19:50:30', '2025-08-01 21:49:30', 14.34, 258.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0024', 'ST04', 'V29', '2025-08-01 07:15:30', '2025-08-01 08:05:30', 6.08, 97.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0025', 'ST04', 'V09', '2025-08-01 20:30:30', '2025-08-02 01:06:30', 33.17, 597.06);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0026', 'ST05', 'V22', '2025-08-01 21:15:00', '2025-08-01 23:41:00', 17.57, 281.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0027', 'ST01', 'V19', '2025-08-01 07:40:00', '2025-08-01 08:46:00', 7.96, 127.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0028', 'ST04', 'V17', '2025-08-01 11:00:00', '2025-08-01 16:26:00', 39.2, 705.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0029', 'ST01', 'V20', '2025-08-01 08:20:30', '2025-08-01 09:48:30', 10.68, 192.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0030', 'ST05', 'V08', '2025-08-01 07:10:30', '2025-08-01 11:33:30', 31.64, 506.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0031', 'ST05', 'V17', '2025-08-01 16:30:00', '2025-08-01 20:57:00', 32.12, 578.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0032', 'ST03', 'V08', '2025-08-01 14:45:00', '2025-08-01 19:13:00', 32.2, 515.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0033', 'ST03', 'V15', '2025-08-01 16:10:00', '2025-08-01 19:28:00', 23.87, 429.66);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0034', 'ST05', 'V04', '2025-08-01 08:20:30', '2025-08-01 09:53:30', 11.17, 201.06);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0035', 'ST03', 'V29', '2025-08-01 08:20:30', '2025-08-01 10:42:30', 17.11, 273.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0036', 'ST04', 'V27', '2025-08-01 15:00:30', '2025-08-01 20:52:30', 42.34, 677.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0037', 'ST01', 'V29', '2025-08-01 10:30:00', '2025-08-01 16:09:00', 40.7, 651.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0038', 'ST05', 'V05', '2025-08-01 14:30:00', '2025-08-01 19:13:00', 33.99, 543.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0039', 'ST03', 'V17', '2025-08-02 21:30:00', '2025-08-02 22:50:00', 9.6, 172.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0040', 'ST04', 'V27', '2025-08-02 14:00:00', '2025-08-02 16:38:00', 19.01, 304.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0041', 'ST02', 'V21', '2025-08-02 14:15:30', '2025-08-02 18:04:30', 27.52, 495.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0042', 'ST04', 'V18', '2025-08-02 06:10:00', '2025-08-02 12:07:00', 42.86, 685.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0043', 'ST02', 'V18', '2025-08-02 07:40:00', '2025-08-02 10:49:00', 22.76, 364.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0044', 'ST01', 'V10', '2025-08-02 17:00:30', '2025-08-02 18:58:30', 14.19, 255.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0045', 'ST02', 'V22', '2025-08-02 09:40:30', '2025-08-02 15:46:30', 43.98, 703.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0046', 'ST02', 'V30', '2025-08-02 13:15:00', '2025-08-02 18:51:00', 40.38, 726.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0047', 'ST01', 'V06', '2025-08-02 16:45:00', '2025-08-02 19:01:00', 16.41, 295.38);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0048', 'ST01', 'V13', '2025-08-02 07:50:00', '2025-08-02 09:44:00', 13.78, 220.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0049', 'ST04', 'V12', '2025-08-02 15:20:00', '2025-08-02 16:17:00', 6.92, 124.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0050', 'ST02', 'V13', '2025-08-02 16:30:00', '2025-08-02 22:34:00', 43.71, 699.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0051', 'ST03', 'V12', '2025-08-02 18:40:00', '2025-08-02 20:07:00', 10.5, 189.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0052', 'ST03', 'V06', '2025-08-02 14:00:00', '2025-08-02 18:03:00', 29.27, 526.86);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0053', 'ST03', 'V24', '2025-08-02 16:45:00', '2025-08-02 19:40:00', 21.02, 336.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0054', 'ST05', 'V07', '2025-08-02 14:00:30', '2025-08-02 14:50:30', 6.07, 109.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0055', 'ST05', 'V22', '2025-08-02 12:40:30', '2025-08-02 13:52:30', 8.73, 139.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0056', 'ST03', 'V20', '2025-08-02 16:10:30', '2025-08-02 19:44:30', 25.78, 464.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0057', 'ST04', 'V11', '2025-08-02 18:30:00', '2025-08-02 20:22:00', 13.48, 215.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0058', 'ST04', 'V22', '2025-08-02 11:30:30', '2025-08-02 15:18:30', 27.37, 437.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0059', 'ST01', 'V10', '2025-08-02 15:20:30', '2025-08-02 20:25:30', 36.64, 659.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0060', 'ST05', 'V21', '2025-08-02 16:50:30', '2025-08-02 20:03:30', 23.24, 418.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0061', 'ST02', 'V17', '2025-08-02 21:15:00', '2025-08-02 23:37:00', 17.07, 307.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0062', 'ST05', 'V11', '2025-08-02 08:20:30', '2025-08-02 10:22:30', 14.76, 236.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0063', 'ST02', 'V05', '2025-08-02 06:00:00', '2025-08-02 12:09:00', 44.37, 709.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0064', 'ST05', 'V28', '2025-08-02 08:50:30', '2025-08-02 14:28:30', 40.56, 730.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0065', 'ST02', 'V23', '2025-08-03 18:50:30', '2025-08-03 20:59:30', 15.52, 279.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0066', 'ST01', 'V29', '2025-08-03 09:45:00', '2025-08-03 11:32:00', 12.86, 205.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0067', 'ST05', 'V15', '2025-08-03 07:20:00', '2025-08-03 10:38:00', 23.8, 428.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0068', 'ST04', 'V22', '2025-08-03 16:50:30', '2025-08-03 22:09:30', 38.39, 614.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0069', 'ST05', 'V15', '2025-08-03 11:50:30', '2025-08-03 14:04:30', 16.11, 289.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0070', 'ST02', 'V27', '2025-08-03 14:50:00', '2025-08-03 17:09:00', 16.71, 267.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0071', 'ST01', 'V23', '2025-08-03 15:20:30', '2025-08-03 17:59:30', 19.1, 343.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0072', 'ST05', 'V03', '2025-08-03 10:15:00', '2025-08-03 13:09:00', 20.94, 376.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0073', 'ST02', 'V23', '2025-08-03 12:10:30', '2025-08-03 15:12:30', 21.9, 394.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0074', 'ST05', 'V15', '2025-08-03 19:00:00', '2025-08-04 00:20:00', 38.48, 692.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0075', 'ST04', 'V29', '2025-08-03 06:45:30', '2025-08-03 07:36:30', 6.23, 99.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0076', 'ST03', 'V10', '2025-08-03 18:45:00', '2025-08-03 22:13:00', 25.04, 450.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0077', 'ST03', 'V14', '2025-08-03 21:00:30', '2025-08-03 23:39:30', 19.11, 305.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0078', 'ST04', 'V24', '2025-08-03 11:50:00', '2025-08-03 17:58:00', 44.25, 708.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0079', 'ST05', 'V01', '2025-08-03 18:00:00', '2025-08-03 22:18:00', 31.07, 497.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0080', 'ST02', 'V28', '2025-08-03 20:15:00', '2025-08-03 22:29:00', 16.15, 290.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0081', 'ST03', 'V07', '2025-08-03 20:40:30', '2025-08-04 01:37:30', 35.69, 642.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0082', 'ST04', 'V09', '2025-08-03 19:30:00', '2025-08-03 22:52:00', 24.34, 438.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0083', 'ST05', 'V02', '2025-08-03 17:20:00', '2025-08-03 22:23:00', 36.47, 656.46);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0084', 'ST01', 'V25', '2025-08-03 06:20:00', '2025-08-03 11:42:00', 38.73, 697.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0085', 'ST05', 'V05', '2025-08-03 13:15:30', '2025-08-03 17:42:30', 32.11, 513.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0086', 'ST05', 'V07', '2025-08-03 20:30:30', '2025-08-03 22:14:30', 12.54, 225.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0087', 'ST05', 'V24', '2025-08-03 09:15:30', '2025-08-03 10:40:30', 10.22, 163.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0088', 'ST01', 'V30', '2025-08-03 15:45:30', '2025-08-03 21:40:30', 42.72, 768.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0089', 'ST02', 'V03', '2025-08-03 13:10:30', '2025-08-03 18:36:30', 39.16, 704.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0090', 'ST05', 'V26', '2025-08-03 09:00:30', '2025-08-03 12:43:30', 26.78, 428.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0091', 'ST03', 'V03', '2025-08-03 16:00:30', '2025-08-03 21:17:30', 38.07, 685.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0092', 'ST01', 'V14', '2025-08-03 17:50:00', '2025-08-03 21:01:00', 22.98, 367.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0093', 'ST05', 'V21', '2025-08-03 14:50:30', '2025-08-03 18:01:30', 22.99, 413.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0094', 'ST05', 'V09', '2025-08-03 16:20:00', '2025-08-03 18:40:00', 16.88, 303.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0095', 'ST04', 'V08', '2025-08-03 20:45:30', '2025-08-03 21:44:30', 7.12, 113.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0096', 'ST03', 'V06', '2025-08-03 21:20:30', '2025-08-04 02:29:30', 37.12, 668.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0097', 'ST03', 'V09', '2025-08-03 14:00:00', '2025-08-03 15:17:00', 9.34, 168.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0098', 'ST04', 'V16', '2025-08-03 13:50:30', '2025-08-03 17:05:30', 23.48, 422.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0099', 'ST01', 'V03', '2025-08-03 15:20:30', '2025-08-03 19:54:30', 32.98, 593.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0100', 'ST03', 'V22', '2025-08-03 17:50:30', '2025-08-03 20:58:30', 22.59, 361.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0101', 'ST05', 'V11', '2025-08-03 17:50:30', '2025-08-03 20:19:30', 17.96, 287.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0102', 'ST02', 'V04', '2025-08-03 12:40:00', '2025-08-03 17:31:00', 34.97, 629.46);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0103', 'ST02', 'V07', '2025-08-04 21:30:30', '2025-08-05 03:38:30', 44.24, 796.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0104', 'ST02', 'V10', '2025-08-04 13:40:00', '2025-08-04 16:08:00', 17.79, 320.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0105', 'ST05', 'V05', '2025-08-04 14:00:00', '2025-08-04 17:49:00', 27.58, 441.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0106', 'ST02', 'V21', '2025-08-04 21:10:00', '2025-08-05 01:06:00', 28.39, 511.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0107', 'ST04', 'V16', '2025-08-04 20:40:00', '2025-08-05 02:43:00', 43.65, 785.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0108', 'ST03', 'V28', '2025-08-04 21:10:00', '2025-08-05 00:10:00', 21.63, 389.34);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0109', 'ST01', 'V19', '2025-08-04 07:15:00', '2025-08-04 12:28:00', 37.63, 602.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0110', 'ST03', 'V03', '2025-08-04 13:10:30', '2025-08-04 17:17:30', 29.65, 533.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0111', 'ST05', 'V08', '2025-08-04 18:50:30', '2025-08-04 21:16:30', 17.6, 281.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0112', 'ST05', 'V14', '2025-08-04 15:00:00', '2025-08-04 20:58:00', 42.96, 687.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0113', 'ST02', 'V21', '2025-08-04 12:30:00', '2025-08-04 14:11:00', 12.13, 218.34);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0114', 'ST02', 'V18', '2025-08-04 08:15:00', '2025-08-04 11:17:00', 21.93, 350.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0115', 'ST05', 'V16', '2025-08-04 15:00:00', '2025-08-04 17:23:00', 17.24, 310.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0116', 'ST03', 'V23', '2025-08-04 20:10:00', '2025-08-05 02:00:00', 42.03, 756.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0117', 'ST05', 'V22', '2025-08-04 12:45:00', '2025-08-04 16:32:00', 27.24, 435.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0118', 'ST02', 'V30', '2025-08-04 14:15:00', '2025-08-04 15:24:00', 8.33, 149.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0119', 'ST03', 'V20', '2025-08-04 15:50:00', '2025-08-04 19:12:00', 24.28, 437.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0120', 'ST03', 'V23', '2025-08-04 18:30:30', '2025-08-04 21:42:30', 23.07, 415.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0121', 'ST05', 'V02', '2025-08-04 19:40:30', '2025-08-04 20:38:30', 7.01, 126.18);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0122', 'ST02', 'V22', '2025-08-04 06:30:00', '2025-08-04 11:27:00', 35.76, 572.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0123', 'ST02', 'V16', '2025-08-04 20:30:00', '2025-08-05 02:44:00', 44.88, 807.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0124', 'ST04', 'V21', '2025-08-04 21:10:30', '2025-08-04 23:53:30', 19.57, 352.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0125', 'ST03', 'V11', '2025-08-04 09:15:30', '2025-08-04 12:18:30', 22.05, 352.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0126', 'ST04', 'V10', '2025-08-04 18:00:30', '2025-08-04 19:18:30', 9.43, 169.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0127', 'ST03', 'V11', '2025-08-04 09:45:00', '2025-08-04 14:08:00', 31.65, 506.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0128', 'ST04', 'V14', '2025-08-05 07:20:30', '2025-08-05 11:32:30', 30.28, 484.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0129', 'ST04', 'V21', '2025-08-05 20:00:00', '2025-08-05 22:16:00', 16.42, 295.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0130', 'ST02', 'V30', '2025-08-05 15:50:30', '2025-08-05 17:19:30', 10.74, 193.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0131', 'ST05', 'V26', '2025-08-05 13:15:30', '2025-08-05 17:04:30', 27.48, 439.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0132', 'ST05', 'V14', '2025-08-05 08:20:00', '2025-08-05 11:39:00', 24.0, 384.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0133', 'ST01', 'V21', '2025-08-05 10:50:30', '2025-08-05 14:25:30', 25.85, 465.3);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0134', 'ST03', 'V14', '2025-08-05 21:50:00', '2025-08-06 01:08:00', 23.81, 380.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0135', 'ST02', 'V13', '2025-08-05 12:15:00', '2025-08-05 14:34:00', 16.77, 268.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0136', 'ST04', 'V11', '2025-08-05 14:00:30', '2025-08-05 18:46:30', 34.32, 549.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0137', 'ST05', 'V19', '2025-08-05 21:15:30', '2025-08-06 01:00:30', 27.0, 432.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0138', 'ST03', 'V11', '2025-08-05 18:50:30', '2025-08-06 00:22:30', 39.91, 638.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0139', 'ST02', 'V19', '2025-08-05 18:20:30', '2025-08-05 19:24:30', 7.7, 123.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0140', 'ST04', 'V23', '2025-08-05 18:45:00', '2025-08-05 22:16:00', 25.32, 455.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0141', 'ST01', 'V05', '2025-08-05 16:10:30', '2025-08-05 17:32:30', 9.89, 158.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0142', 'ST04', 'V01', '2025-08-05 10:45:00', '2025-08-05 11:59:00', 8.92, 142.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0143', 'ST03', 'V11', '2025-08-05 18:10:30', '2025-08-05 23:37:30', 39.24, 627.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0144', 'ST05', 'V13', '2025-08-05 16:50:00', '2025-08-05 21:00:00', 30.08, 481.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0145', 'ST02', 'V21', '2025-08-05 15:20:00', '2025-08-05 18:31:00', 22.92, 412.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0146', 'ST01', 'V25', '2025-08-05 09:50:00', '2025-08-05 14:25:00', 33.07, 595.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0147', 'ST01', 'V02', '2025-08-05 16:00:30', '2025-08-05 18:46:30', 19.98, 359.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0148', 'ST04', 'V05', '2025-08-05 13:45:00', '2025-08-05 15:30:00', 12.63, 202.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0149', 'ST01', 'V20', '2025-08-05 18:20:30', '2025-08-06 00:06:30', 41.6, 748.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0150', 'ST02', 'V08', '2025-08-05 20:30:30', '2025-08-05 22:43:30', 15.96, 255.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0151', 'ST01', 'V29', '2025-08-05 20:30:00', '2025-08-05 21:44:00', 8.88, 142.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0152', 'ST03', 'V19', '2025-08-05 15:45:30', '2025-08-05 19:03:30', 23.82, 381.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0153', 'ST03', 'V07', '2025-08-05 18:50:00', '2025-08-05 20:57:00', 15.25, 274.5);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0154', 'ST05', 'V12', '2025-08-05 15:30:00', '2025-08-05 21:37:00', 44.14, 794.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0155', 'ST04', 'V09', '2025-08-05 06:00:30', '2025-08-05 11:20:30', 38.48, 692.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0156', 'ST03', 'V25', '2025-08-05 13:40:00', '2025-08-05 17:56:00', 30.83, 554.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0157', 'ST05', 'V09', '2025-08-05 10:10:00', '2025-08-05 12:40:00', 18.05, 324.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0158', 'ST04', 'V02', '2025-08-05 17:15:00', '2025-08-05 23:00:00', 41.48, 746.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0159', 'ST03', 'V24', '2025-08-05 19:15:00', '2025-08-05 20:47:00', 11.15, 178.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0160', 'ST05', 'V29', '2025-08-05 17:30:00', '2025-08-05 19:43:00', 16.02, 256.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0161', 'ST04', 'V26', '2025-08-05 15:40:00', '2025-08-05 19:02:00', 24.26, 388.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0162', 'ST01', 'V05', '2025-08-05 13:45:30', '2025-08-05 15:04:30', 9.52, 152.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0163', 'ST04', 'V01', '2025-08-05 14:10:30', '2025-08-05 16:59:30', 20.37, 325.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0164', 'ST03', 'V19', '2025-08-05 18:40:00', '2025-08-05 23:09:00', 32.32, 517.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0165', 'ST01', 'V20', '2025-08-06 16:20:00', '2025-08-06 20:36:00', 30.78, 554.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0166', 'ST04', 'V30', '2025-08-06 15:45:00', '2025-08-06 17:20:00', 11.45, 206.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0167', 'ST01', 'V10', '2025-08-06 21:10:00', '2025-08-06 23:16:00', 15.16, 272.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0168', 'ST05', 'V05', '2025-08-06 18:50:30', '2025-08-06 23:17:30', 32.15, 514.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0169', 'ST05', 'V14', '2025-08-06 10:45:00', '2025-08-06 16:05:00', 38.51, 616.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0170', 'ST05', 'V14', '2025-08-06 14:00:30', '2025-08-06 16:00:30', 14.47, 231.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0171', 'ST04', 'V08', '2025-08-06 17:10:30', '2025-08-06 20:56:30', 27.23, 435.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0172', 'ST03', 'V02', '2025-08-06 18:30:00', '2025-08-07 00:34:00', 43.76, 787.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0173', 'ST04', 'V03', '2025-08-06 12:00:00', '2025-08-06 17:05:00', 36.68, 660.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0174', 'ST02', 'V05', '2025-08-06 12:10:00', '2025-08-06 16:10:00', 28.87, 461.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0175', 'ST02', 'V11', '2025-08-06 10:00:30', '2025-08-06 15:28:30', 39.48, 631.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0176', 'ST02', 'V05', '2025-08-06 14:15:00', '2025-08-06 18:39:00', 31.78, 508.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0177', 'ST01', 'V05', '2025-08-06 06:40:00', '2025-08-06 10:41:00', 28.97, 463.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0178', 'ST01', 'V06', '2025-08-06 14:00:00', '2025-08-06 18:51:00', 34.93, 628.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0179', 'ST05', 'V04', '2025-08-06 08:50:30', '2025-08-06 13:52:30', 36.34, 654.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0180', 'ST05', 'V19', '2025-08-06 09:50:00', '2025-08-06 15:47:00', 42.87, 685.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0181', 'ST01', 'V24', '2025-08-06 15:50:00', '2025-08-06 16:59:00', 8.37, 133.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0182', 'ST04', 'V28', '2025-08-06 18:45:00', '2025-08-06 22:14:00', 25.12, 452.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0183', 'ST04', 'V03', '2025-08-06 08:40:00', '2025-08-06 09:51:00', 8.56, 154.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0184', 'ST03', 'V20', '2025-08-06 16:45:30', '2025-08-06 20:02:30', 23.69, 426.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0185', 'ST05', 'V14', '2025-08-06 09:10:00', '2025-08-06 12:19:00', 22.77, 364.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0186', 'ST02', 'V14', '2025-08-06 16:50:30', '2025-08-06 19:55:30', 22.22, 355.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0187', 'ST01', 'V11', '2025-08-06 19:40:30', '2025-08-06 22:31:30', 20.6, 329.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0188', 'ST02', 'V22', '2025-08-06 21:10:00', '2025-08-07 02:30:00', 38.44, 615.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0189', 'ST01', 'V14', '2025-08-06 09:40:00', '2025-08-06 13:30:00', 27.7, 443.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0190', 'ST05', 'V18', '2025-08-06 16:10:30', '2025-08-06 18:54:30', 19.79, 316.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0191', 'ST04', 'V28', '2025-08-06 07:30:30', '2025-08-06 10:14:30', 19.71, 354.78);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0192', 'ST05', 'V17', '2025-08-06 12:15:30', '2025-08-06 14:17:30', 14.75, 265.5);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0193', 'ST01', 'V12', '2025-08-06 17:10:30', '2025-08-06 21:06:30', 28.39, 511.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0194', 'ST04', 'V28', '2025-08-06 06:30:00', '2025-08-06 08:18:00', 13.04, 234.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0195', 'ST03', 'V30', '2025-08-06 16:40:00', '2025-08-06 18:28:00', 13.07, 235.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0196', 'ST02', 'V19', '2025-08-06 18:10:00', '2025-08-06 23:00:00', 34.9, 558.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0197', 'ST01', 'V03', '2025-08-06 12:45:30', '2025-08-06 16:02:30', 23.69, 426.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0198', 'ST02', 'V12', '2025-08-06 15:40:00', '2025-08-06 21:17:00', 40.45, 728.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0199', 'ST02', 'V06', '2025-08-06 07:10:30', '2025-08-06 10:24:30', 23.28, 419.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0200', 'ST04', 'V20', '2025-08-07 20:45:30', '2025-08-07 22:45:30', 14.41, 259.38);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0201', 'ST05', 'V04', '2025-08-07 17:45:00', '2025-08-07 20:07:00', 17.05, 306.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0202', 'ST05', 'V16', '2025-08-07 15:00:00', '2025-08-07 17:58:00', 21.42, 385.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0203', 'ST05', 'V02', '2025-08-07 06:20:30', '2025-08-07 12:17:30', 42.87, 771.66);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0204', 'ST02', 'V25', '2025-08-07 14:30:30', '2025-08-07 15:58:30', 10.68, 192.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0205', 'ST04', 'V24', '2025-08-07 19:15:00', '2025-08-07 22:08:00', 20.83, 333.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0206', 'ST02', 'V17', '2025-08-07 17:10:30', '2025-08-07 22:40:30', 39.61, 712.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0207', 'ST01', 'V14', '2025-08-07 06:50:00', '2025-08-07 12:20:00', 39.62, 633.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0208', 'ST05', 'V14', '2025-08-07 18:45:30', '2025-08-07 20:12:30', 10.49, 167.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0209', 'ST01', 'V11', '2025-08-07 11:50:30', '2025-08-07 13:08:30', 9.44, 151.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0210', 'ST01', 'V08', '2025-08-07 19:45:00', '2025-08-07 22:43:00', 21.43, 342.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0211', 'ST03', 'V24', '2025-08-07 16:20:30', '2025-08-07 21:23:30', 36.39, 582.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0212', 'ST01', 'V17', '2025-08-07 09:20:30', '2025-08-07 12:04:30', 19.69, 354.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0213', 'ST02', 'V08', '2025-08-07 09:15:30', '2025-08-07 11:09:30', 13.69, 219.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0214', 'ST05', 'V05', '2025-08-07 08:15:30', '2025-08-07 11:35:30', 24.09, 385.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0215', 'ST05', 'V25', '2025-08-07 20:40:30', '2025-08-07 22:19:30', 11.89, 214.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0216', 'ST01', 'V16', '2025-08-07 20:30:30', '2025-08-08 00:32:30', 29.07, 523.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0217', 'ST03', 'V17', '2025-08-07 08:30:30', '2025-08-07 11:46:30', 23.62, 425.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0218', 'ST01', 'V12', '2025-08-07 15:10:00', '2025-08-07 19:19:00', 29.99, 539.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0219', 'ST05', 'V13', '2025-08-07 20:00:30', '2025-08-08 01:45:30', 41.45, 663.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0220', 'ST05', 'V21', '2025-08-07 12:40:30', '2025-08-07 16:12:30', 25.55, 459.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0221', 'ST01', 'V15', '2025-08-07 09:40:00', '2025-08-07 13:14:00', 25.68, 462.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0222', 'ST02', 'V02', '2025-08-07 13:50:30', '2025-08-07 17:30:30', 26.44, 475.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0223', 'ST05', 'V06', '2025-08-07 17:40:30', '2025-08-07 20:35:30', 21.11, 379.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0224', 'ST03', 'V22', '2025-08-07 07:40:00', '2025-08-07 10:17:00', 18.86, 301.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0225', 'ST05', 'V22', '2025-08-07 18:30:30', '2025-08-07 23:15:30', 34.23, 547.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0226', 'ST05', 'V28', '2025-08-07 10:40:00', '2025-08-07 14:39:00', 28.73, 517.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0227', 'ST02', 'V30', '2025-08-07 17:30:30', '2025-08-07 19:01:30', 11.03, 198.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0228', 'ST01', 'V10', '2025-08-07 18:40:00', '2025-08-07 23:07:00', 32.13, 578.34);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0229', 'ST05', 'V03', '2025-08-07 19:40:00', '2025-08-07 22:27:00', 20.14, 362.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0230', 'ST02', 'V07', '2025-08-07 16:50:00', '2025-08-07 18:53:00', 14.84, 267.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0231', 'ST02', 'V05', '2025-08-07 08:30:00', '2025-08-07 12:05:00', 25.8, 412.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0232', 'ST05', 'V27', '2025-08-07 07:40:00', '2025-08-07 11:44:00', 29.29, 468.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0233', 'ST02', 'V06', '2025-08-08 11:50:00', '2025-08-08 14:53:00', 22.02, 396.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0234', 'ST02', 'V15', '2025-08-08 15:50:00', '2025-08-08 19:33:00', 26.83, 482.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0235', 'ST03', 'V26', '2025-08-08 21:20:30', '2025-08-09 01:50:30', 32.45, 519.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0236', 'ST05', 'V15', '2025-08-08 20:30:30', '2025-08-09 00:03:30', 25.61, 460.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0237', 'ST04', 'V06', '2025-08-08 12:15:30', '2025-08-08 13:21:30', 8.04, 144.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0238', 'ST04', 'V28', '2025-08-08 17:10:00', '2025-08-08 19:32:00', 17.12, 308.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0239', 'ST02', 'V09', '2025-08-08 20:15:30', '2025-08-08 21:34:30', 9.58, 172.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0240', 'ST02', 'V27', '2025-08-08 20:40:00', '2025-08-08 23:44:00', 22.18, 354.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0241', 'ST04', 'V17', '2025-08-08 17:20:30', '2025-08-08 23:33:30', 44.79, 806.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0242', 'ST03', 'V08', '2025-08-08 06:40:00', '2025-08-08 12:02:00', 38.73, 619.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0243', 'ST03', 'V26', '2025-08-08 10:15:00', '2025-08-08 12:38:00', 17.19, 275.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0244', 'ST04', 'V23', '2025-08-08 10:50:30', '2025-08-08 15:00:30', 30.0, 540.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0245', 'ST01', 'V01', '2025-08-08 14:20:00', '2025-08-08 18:08:00', 27.4, 438.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0246', 'ST05', 'V17', '2025-08-08 19:10:30', '2025-08-08 21:17:30', 15.27, 274.86);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0247', 'ST01', 'V02', '2025-08-08 13:45:30', '2025-08-08 14:55:30', 8.45, 152.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0248', 'ST04', 'V20', '2025-08-08 06:20:00', '2025-08-08 08:44:00', 17.36, 312.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0249', 'ST01', 'V20', '2025-08-08 17:20:30', '2025-08-08 19:10:30', 13.31, 239.58);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0250', 'ST01', 'V17', '2025-08-08 17:10:00', '2025-08-08 20:06:00', 21.23, 382.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0251', 'ST04', 'V02', '2025-08-08 18:40:30', '2025-08-08 23:32:30', 35.15, 632.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0252', 'ST03', 'V26', '2025-08-08 08:40:00', '2025-08-08 13:28:00', 34.58, 553.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0253', 'ST01', 'V25', '2025-08-08 16:15:00', '2025-08-08 18:59:00', 19.74, 355.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0254', 'ST03', 'V27', '2025-08-08 11:50:30', '2025-08-08 16:05:30', 30.64, 490.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0255', 'ST02', 'V03', '2025-08-08 20:00:30', '2025-08-08 21:55:30', 13.86, 249.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0256', 'ST02', 'V29', '2025-08-08 07:40:30', '2025-08-08 11:17:30', 26.1, 417.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0257', 'ST04', 'V09', '2025-08-09 07:20:30', '2025-08-09 10:06:30', 19.92, 358.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0258', 'ST01', 'V28', '2025-08-09 16:30:00', '2025-08-09 21:39:00', 37.17, 669.06);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0259', 'ST04', 'V29', '2025-08-09 18:50:30', '2025-08-09 21:30:30', 19.22, 307.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0260', 'ST02', 'V16', '2025-08-09 21:40:30', '2025-08-10 02:50:30', 37.24, 670.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0261', 'ST04', 'V03', '2025-08-09 19:15:30', '2025-08-09 21:49:30', 18.53, 333.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0262', 'ST01', 'V11', '2025-08-09 15:30:30', '2025-08-09 19:35:30', 29.5, 472.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0263', 'ST04', 'V06', '2025-08-09 20:40:30', '2025-08-09 21:43:30', 7.65, 137.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0264', 'ST03', 'V20', '2025-08-09 19:30:00', '2025-08-09 20:44:00', 8.93, 160.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0265', 'ST04', 'V12', '2025-08-09 11:00:00', '2025-08-09 16:25:00', 39.1, 703.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0266', 'ST04', 'V02', '2025-08-09 10:10:00', '2025-08-09 15:13:00', 36.36, 654.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0267', 'ST03', 'V12', '2025-08-09 18:00:00', '2025-08-09 22:30:00', 32.48, 584.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0268', 'ST03', 'V12', '2025-08-09 20:10:00', '2025-08-09 23:52:00', 26.65, 479.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0269', 'ST04', 'V11', '2025-08-09 14:20:00', '2025-08-09 15:18:00', 7.01, 112.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0270', 'ST02', 'V16', '2025-08-09 18:10:30', '2025-08-09 23:11:30', 36.22, 651.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0271', 'ST04', 'V07', '2025-08-09 15:50:00', '2025-08-09 17:19:00', 10.78, 194.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0272', 'ST01', 'V15', '2025-08-09 11:50:00', '2025-08-09 17:03:00', 37.61, 676.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0273', 'ST03', 'V22', '2025-08-09 17:10:30', '2025-08-09 22:49:30', 40.76, 652.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0274', 'ST02', 'V23', '2025-08-09 11:40:00', '2025-08-09 13:09:00', 10.73, 193.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0275', 'ST02', 'V26', '2025-08-09 10:20:30', '2025-08-09 11:18:30', 7.03, 112.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0276', 'ST05', 'V19', '2025-08-09 17:50:00', '2025-08-09 21:58:00', 29.87, 477.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0277', 'ST01', 'V03', '2025-08-09 15:45:30', '2025-08-09 19:25:30', 26.5, 477.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0278', 'ST04', 'V27', '2025-08-09 08:15:30', '2025-08-09 12:33:30', 31.05, 496.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0279', 'ST04', 'V15', '2025-08-09 17:15:00', '2025-08-09 22:14:00', 35.94, 646.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0280', 'ST02', 'V14', '2025-08-09 07:10:00', '2025-08-09 09:38:00', 17.86, 285.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0281', 'ST02', 'V11', '2025-08-09 13:40:30', '2025-08-09 19:04:30', 38.99, 623.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0282', 'ST03', 'V07', '2025-08-09 14:15:30', '2025-08-09 18:24:30', 29.96, 539.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0283', 'ST01', 'V17', '2025-08-09 11:15:00', '2025-08-09 15:39:00', 31.69, 570.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0284', 'ST05', 'V11', '2025-08-09 07:00:00', '2025-08-09 08:04:00', 7.77, 124.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0285', 'ST05', 'V09', '2025-08-09 12:45:00', '2025-08-09 16:16:00', 25.42, 457.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0286', 'ST05', 'V10', '2025-08-09 15:50:00', '2025-08-09 21:01:00', 37.38, 672.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0287', 'ST04', 'V10', '2025-08-09 20:10:00', '2025-08-09 21:51:00', 12.17, 219.06);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0288', 'ST04', 'V16', '2025-08-09 20:20:30', '2025-08-10 00:27:30', 29.66, 533.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0289', 'ST03', 'V28', '2025-08-09 16:40:30', '2025-08-09 18:12:30', 11.1, 199.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0290', 'ST03', 'V17', '2025-08-09 09:40:00', '2025-08-09 13:01:00', 24.19, 435.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0291', 'ST03', 'V15', '2025-08-09 13:15:00', '2025-08-09 14:21:00', 7.97, 143.46);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0292', 'ST04', 'V28', '2025-08-09 19:20:00', '2025-08-10 00:34:00', 37.73, 679.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0293', 'ST05', 'V24', '2025-08-09 16:20:00', '2025-08-09 19:51:00', 25.43, 406.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0294', 'ST04', 'V16', '2025-08-10 15:50:00', '2025-08-10 17:09:00', 9.51, 171.18);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0295', 'ST04', 'V17', '2025-08-10 20:20:00', '2025-08-11 00:19:00', 28.75, 517.5);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0296', 'ST01', 'V02', '2025-08-10 15:50:30', '2025-08-10 18:12:30', 17.14, 308.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0297', 'ST01', 'V28', '2025-08-10 09:45:00', '2025-08-10 15:21:00', 40.42, 727.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0298', 'ST03', 'V25', '2025-08-10 18:40:00', '2025-08-10 21:40:00', 21.62, 389.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0299', 'ST05', 'V18', '2025-08-10 12:40:30', '2025-08-10 13:53:30', 8.87, 141.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0300', 'ST05', 'V15', '2025-08-10 14:10:00', '2025-08-10 20:16:00', 44.03, 792.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0301', 'ST04', 'V12', '2025-08-10 16:40:00', '2025-08-10 18:34:00', 13.76, 247.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0302', 'ST05', 'V13', '2025-08-10 07:00:00', '2025-08-10 08:34:00', 11.34, 181.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0303', 'ST03', 'V26', '2025-08-10 21:50:00', '2025-08-11 01:56:00', 29.64, 474.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0304', 'ST05', 'V05', '2025-08-10 16:40:00', '2025-08-10 19:37:00', 21.33, 341.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0305', 'ST05', 'V24', '2025-08-10 15:40:30', '2025-08-10 20:20:30', 33.64, 538.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0306', 'ST03', 'V16', '2025-08-10 06:40:30', '2025-08-10 11:09:30', 32.28, 581.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0307', 'ST04', 'V19', '2025-08-10 15:00:30', '2025-08-10 17:16:30', 16.36, 261.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0308', 'ST05', 'V19', '2025-08-10 13:00:30', '2025-08-10 14:45:30', 12.65, 202.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0309', 'ST05', 'V25', '2025-08-10 18:15:00', '2025-08-10 19:15:00', 7.23, 130.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0310', 'ST01', 'V07', '2025-08-10 06:50:30', '2025-08-10 09:56:30', 22.33, 401.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0311', 'ST04', 'V23', '2025-08-10 12:45:30', '2025-08-10 18:18:30', 40.04, 720.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0312', 'ST01', 'V23', '2025-08-10 10:20:30', '2025-08-10 16:34:30', 44.93, 808.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0313', 'ST04', 'V17', '2025-08-10 18:40:00', '2025-08-10 21:59:00', 23.93, 430.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0314', 'ST05', 'V11', '2025-08-10 17:30:30', '2025-08-10 19:22:30', 13.5, 216.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0315', 'ST02', 'V09', '2025-08-10 15:20:30', '2025-08-10 20:20:30', 36.08, 649.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0316', 'ST02', 'V23', '2025-08-10 21:40:30', '2025-08-11 00:23:30', 19.6, 352.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0317', 'ST03', 'V10', '2025-08-10 09:45:30', '2025-08-10 15:01:30', 37.92, 682.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0318', 'ST02', 'V10', '2025-08-10 07:30:00', '2025-08-10 10:12:00', 19.51, 351.18);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0319', 'ST04', 'V21', '2025-08-10 14:50:00', '2025-08-10 16:45:00', 13.88, 249.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0320', 'ST05', 'V09', '2025-08-10 14:15:00', '2025-08-10 18:25:00', 30.01, 540.18);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0321', 'ST05', 'V08', '2025-08-10 13:00:00', '2025-08-10 17:17:00', 30.88, 494.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0322', 'ST01', 'V04', '2025-08-10 19:40:30', '2025-08-10 21:02:30', 9.92, 178.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0323', 'ST02', 'V01', '2025-08-10 11:45:30', '2025-08-10 15:10:30', 24.62, 393.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0324', 'ST02', 'V25', '2025-08-10 15:40:30', '2025-08-10 19:59:30', 31.19, 561.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0325', 'ST01', 'V21', '2025-08-10 13:00:00', '2025-08-10 16:05:00', 22.3, 401.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0326', 'ST02', 'V30', '2025-08-10 07:45:30', '2025-08-10 09:35:30', 13.27, 238.86);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0327', 'ST03', 'V29', '2025-08-10 07:00:30', '2025-08-10 10:54:30', 28.15, 450.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0328', 'ST01', 'V30', '2025-08-10 16:30:30', '2025-08-10 22:41:30', 44.57, 802.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0329', 'ST05', 'V17', '2025-08-10 21:15:30', '2025-08-10 23:33:30', 16.64, 299.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0330', 'ST03', 'V06', '2025-08-11 20:30:00', '2025-08-11 21:24:00', 6.55, 117.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0331', 'ST03', 'V26', '2025-08-11 15:20:00', '2025-08-11 19:28:00', 29.83, 477.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0332', 'ST04', 'V27', '2025-08-11 19:40:00', '2025-08-11 22:40:00', 21.63, 346.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0333', 'ST01', 'V06', '2025-08-11 10:50:30', '2025-08-11 16:44:30', 42.5, 765.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0334', 'ST01', 'V09', '2025-08-11 18:20:30', '2025-08-11 23:14:30', 35.4, 637.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0335', 'ST03', 'V10', '2025-08-11 06:30:30', '2025-08-11 11:05:30', 33.02, 594.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0336', 'ST01', 'V22', '2025-08-11 09:50:30', '2025-08-11 11:31:30', 12.23, 195.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0337', 'ST05', 'V30', '2025-08-11 15:10:30', '2025-08-11 17:59:30', 20.33, 365.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0338', 'ST02', 'V08', '2025-08-11 10:50:00', '2025-08-11 14:07:00', 23.74, 379.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0339', 'ST05', 'V12', '2025-08-11 19:50:00', '2025-08-12 00:47:00', 35.71, 642.78);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0340', 'ST05', 'V28', '2025-08-11 08:50:30', '2025-08-11 10:05:30', 9.05, 162.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0341', 'ST05', 'V04', '2025-08-11 07:20:00', '2025-08-11 09:03:00', 12.42, 223.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0342', 'ST05', 'V15', '2025-08-11 09:20:30', '2025-08-11 10:39:30', 9.55, 171.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0343', 'ST05', 'V15', '2025-08-11 07:50:00', '2025-08-11 11:26:00', 26.02, 468.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0344', 'ST04', 'V19', '2025-08-11 07:50:30', '2025-08-11 12:35:30', 34.21, 547.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0345', 'ST04', 'V09', '2025-08-11 06:20:00', '2025-08-11 07:24:00', 7.77, 139.86);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0346', 'ST03', 'V23', '2025-08-11 08:00:00', '2025-08-11 14:10:00', 44.46, 800.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0347', 'ST04', 'V02', '2025-08-11 15:45:00', '2025-08-11 20:44:00', 35.99, 647.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0348', 'ST04', 'V12', '2025-08-11 18:50:30', '2025-08-11 21:42:30', 20.65, 371.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0349', 'ST05', 'V05', '2025-08-11 17:10:00', '2025-08-11 23:22:00', 44.72, 715.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0350', 'ST04', 'V17', '2025-08-11 10:20:00', '2025-08-11 15:15:00', 35.49, 638.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0351', 'ST03', 'V15', '2025-08-11 19:45:00', '2025-08-11 21:55:00', 15.65, 281.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0352', 'ST03', 'V05', '2025-08-11 14:20:00', '2025-08-11 15:20:00', 7.26, 116.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0353', 'ST05', 'V25', '2025-08-12 06:20:00', '2025-08-12 07:31:00', 8.62, 155.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0354', 'ST05', 'V02', '2025-08-12 20:00:00', '2025-08-13 00:50:00', 34.88, 627.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0355', 'ST04', 'V15', '2025-08-12 13:20:00', '2025-08-12 14:55:00', 11.47, 206.46);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0356', 'ST03', 'V08', '2025-08-12 16:40:00', '2025-08-12 19:08:00', 17.77, 284.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0357', 'ST02', 'V22', '2025-08-12 13:45:30', '2025-08-12 16:04:30', 16.73, 267.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0358', 'ST05', 'V19', '2025-08-12 11:45:30', '2025-08-12 12:50:30', 7.83, 125.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0359', 'ST03', 'V21', '2025-08-12 18:40:30', '2025-08-12 21:42:30', 21.92, 394.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0360', 'ST03', 'V13', '2025-08-12 11:50:00', '2025-08-12 17:15:00', 39.12, 625.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0361', 'ST03', 'V28', '2025-08-12 10:50:00', '2025-08-12 14:42:00', 27.93, 502.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0362', 'ST04', 'V18', '2025-08-12 10:45:00', '2025-08-12 12:57:00', 15.94, 255.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0363', 'ST03', 'V21', '2025-08-12 08:50:30', '2025-08-12 10:10:30', 9.61, 172.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0364', 'ST02', 'V02', '2025-08-12 14:45:00', '2025-08-12 20:18:00', 40.07, 721.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0365', 'ST02', 'V26', '2025-08-12 12:50:00', '2025-08-12 18:22:00', 39.91, 638.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0366', 'ST03', 'V10', '2025-08-12 06:20:00', '2025-08-12 12:22:00', 43.52, 783.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0367', 'ST01', 'V24', '2025-08-12 21:20:00', '2025-08-13 00:18:00', 21.47, 343.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0368', 'ST02', 'V18', '2025-08-12 16:30:30', '2025-08-12 19:51:30', 24.18, 386.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0369', 'ST03', 'V10', '2025-08-12 14:40:30', '2025-08-12 18:01:30', 24.17, 435.06);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0370', 'ST04', 'V25', '2025-08-12 16:20:30', '2025-08-12 18:51:30', 18.2, 327.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0371', 'ST01', 'V19', '2025-08-12 13:15:00', '2025-08-12 15:29:00', 16.17, 258.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0372', 'ST05', 'V19', '2025-08-12 19:30:00', '2025-08-12 21:23:00', 13.65, 218.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0373', 'ST02', 'V13', '2025-08-12 13:50:30', '2025-08-12 16:03:30', 16.04, 256.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0374', 'ST04', 'V24', '2025-08-12 21:50:00', '2025-08-13 02:38:00', 34.58, 553.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0375', 'ST03', 'V06', '2025-08-12 10:50:00', '2025-08-12 16:38:00', 41.76, 751.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0376', 'ST05', 'V21', '2025-08-12 07:00:00', '2025-08-12 12:57:00', 42.86, 771.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0377', 'ST01', 'V25', '2025-08-12 06:45:00', '2025-08-12 12:08:00', 38.86, 699.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0378', 'ST02', 'V03', '2025-08-12 10:00:00', '2025-08-12 13:34:00', 25.72, 462.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0379', 'ST03', 'V02', '2025-08-12 21:50:00', '2025-08-12 22:42:00', 6.26, 112.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0380', 'ST05', 'V14', '2025-08-12 06:00:30', '2025-08-12 09:44:30', 26.89, 430.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0381', 'ST03', 'V01', '2025-08-12 19:15:00', '2025-08-13 01:03:00', 41.8, 668.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0382', 'ST05', 'V05', '2025-08-12 13:20:30', '2025-08-12 18:34:30', 37.79, 604.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0383', 'ST03', 'V26', '2025-08-12 18:10:30', '2025-08-13 00:11:30', 43.41, 694.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0384', 'ST04', 'V19', '2025-08-12 13:20:30', '2025-08-12 17:52:30', 32.68, 522.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0385', 'ST01', 'V21', '2025-08-12 07:10:30', '2025-08-12 10:03:30', 20.79, 374.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0386', 'ST04', 'V02', '2025-08-13 06:15:00', '2025-08-13 09:47:00', 25.49, 458.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0387', 'ST04', 'V21', '2025-08-13 16:10:00', '2025-08-13 18:14:00', 14.96, 269.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0388', 'ST05', 'V16', '2025-08-13 14:00:00', '2025-08-13 18:32:00', 32.69, 588.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0389', 'ST03', 'V29', '2025-08-13 07:15:30', '2025-08-13 08:10:30', 6.61, 105.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0390', 'ST02', 'V19', '2025-08-13 10:45:00', '2025-08-13 13:12:00', 17.67, 282.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0391', 'ST05', 'V08', '2025-08-13 18:40:30', '2025-08-13 23:35:30', 35.47, 567.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0392', 'ST02', 'V26', '2025-08-13 08:40:00', '2025-08-13 10:01:00', 9.81, 156.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0393', 'ST02', 'V27', '2025-08-13 08:40:30', '2025-08-13 14:44:30', 43.79, 700.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0394', 'ST03', 'V01', '2025-08-13 14:50:30', '2025-08-13 16:54:30', 14.9, 238.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0395', 'ST05', 'V13', '2025-08-13 19:15:30', '2025-08-13 20:32:30', 9.34, 149.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0396', 'ST05', 'V10', '2025-08-13 13:10:00', '2025-08-13 15:27:00', 16.45, 296.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0397', 'ST04', 'V23', '2025-08-13 10:45:30', '2025-08-13 13:32:30', 20.07, 361.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0398', 'ST01', 'V01', '2025-08-13 15:50:30', '2025-08-13 20:47:30', 35.69, 571.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0399', 'ST01', 'V05', '2025-08-13 08:15:30', '2025-08-13 11:30:30', 23.5, 376.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0400', 'ST05', 'V17', '2025-08-13 19:10:00', '2025-08-13 20:29:00', 9.5, 171.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0401', 'ST05', 'V03', '2025-08-13 16:45:00', '2025-08-13 19:09:00', 17.38, 312.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0402', 'ST04', 'V25', '2025-08-13 08:20:00', '2025-08-13 12:52:00', 32.73, 589.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0403', 'ST02', 'V05', '2025-08-13 14:30:30', '2025-08-13 18:00:30', 25.23, 403.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0404', 'ST01', 'V06', '2025-08-13 19:30:30', '2025-08-13 21:57:30', 17.69, 318.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0405', 'ST01', 'V12', '2025-08-13 14:20:30', '2025-08-13 18:23:30', 29.16, 524.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0406', 'ST02', 'V15', '2025-08-13 09:15:30', '2025-08-13 10:07:30', 6.26, 112.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0407', 'ST04', 'V11', '2025-08-13 18:40:30', '2025-08-13 21:18:30', 19.05, 304.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0408', 'ST05', 'V05', '2025-08-13 15:40:00', '2025-08-13 19:05:00', 24.68, 394.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0409', 'ST02', 'V13', '2025-08-13 16:30:30', '2025-08-13 22:34:30', 43.74, 699.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0410', 'ST02', 'V11', '2025-08-13 18:30:30', '2025-08-13 21:18:30', 20.24, 323.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0411', 'ST05', 'V07', '2025-08-13 11:00:30', '2025-08-13 16:56:30', 42.78, 770.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0412', 'ST02', 'V15', '2025-08-13 15:10:30', '2025-08-13 19:38:30', 32.25, 580.5);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0413', 'ST02', 'V21', '2025-08-13 15:20:30', '2025-08-13 19:44:30', 31.69, 570.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0414', 'ST04', 'V26', '2025-08-13 18:10:30', '2025-08-14 00:22:30', 44.64, 714.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0415', 'ST04', 'V19', '2025-08-13 18:45:00', '2025-08-13 23:52:00', 36.84, 589.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0416', 'ST03', 'V23', '2025-08-13 08:10:00', '2025-08-13 12:33:00', 31.65, 569.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0417', 'ST03', 'V06', '2025-08-13 07:45:30', '2025-08-13 13:48:30', 43.66, 785.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0418', 'ST04', 'V04', '2025-08-13 06:10:30', '2025-08-13 08:12:30', 14.66, 263.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0419', 'ST05', 'V18', '2025-08-13 13:50:30', '2025-08-13 16:47:30', 21.25, 340.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0420', 'ST05', 'V23', '2025-08-13 10:40:00', '2025-08-13 14:06:00', 24.83, 446.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0421', 'ST03', 'V14', '2025-08-13 08:10:00', '2025-08-13 10:53:00', 19.58, 313.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0422', 'ST03', 'V15', '2025-08-13 12:50:30', '2025-08-13 16:14:30', 24.57, 442.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0423', 'ST04', 'V11', '2025-08-14 08:30:00', '2025-08-14 13:43:00', 37.6, 601.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0424', 'ST01', 'V01', '2025-08-14 16:10:00', '2025-08-14 22:02:00', 42.27, 676.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0425', 'ST02', 'V17', '2025-08-14 11:15:30', '2025-08-14 15:06:30', 27.83, 500.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0426', 'ST04', 'V08', '2025-08-14 18:15:00', '2025-08-14 22:33:00', 30.98, 495.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0427', 'ST04', 'V13', '2025-08-14 06:20:30', '2025-08-14 10:22:30', 29.1, 465.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0428', 'ST04', 'V01', '2025-08-14 12:20:30', '2025-08-14 17:14:30', 35.34, 565.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0429', 'ST01', 'V19', '2025-08-14 09:15:30', '2025-08-14 11:50:30', 18.71, 299.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0430', 'ST04', 'V04', '2025-08-14 14:50:30', '2025-08-14 18:54:30', 29.28, 527.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0431', 'ST05', 'V13', '2025-08-14 09:40:30', '2025-08-14 15:04:30', 38.98, 623.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0432', 'ST05', 'V06', '2025-08-14 15:10:00', '2025-08-14 17:41:00', 18.21, 327.78);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0433', 'ST02', 'V10', '2025-08-14 09:15:30', '2025-08-14 13:50:30', 33.04, 594.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0434', 'ST05', 'V13', '2025-08-14 19:15:30', '2025-08-14 22:22:30', 22.5, 360.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0435', 'ST04', 'V21', '2025-08-14 11:15:30', '2025-08-14 13:38:30', 17.26, 310.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0436', 'ST02', 'V11', '2025-08-14 20:00:30', '2025-08-15 01:59:30', 43.12, 689.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0437', 'ST04', 'V05', '2025-08-14 12:45:30', '2025-08-14 15:48:30', 21.96, 351.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0438', 'ST04', 'V14', '2025-08-14 20:50:00', '2025-08-14 22:06:00', 9.22, 147.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0439', 'ST01', 'V26', '2025-08-14 13:30:00', '2025-08-14 15:49:00', 16.72, 267.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0440', 'ST05', 'V10', '2025-08-14 11:50:30', '2025-08-14 15:38:30', 27.44, 493.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0441', 'ST01', 'V19', '2025-08-14 09:30:30', '2025-08-14 13:16:30', 27.14, 434.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0442', 'ST01', 'V25', '2025-08-14 20:20:30', '2025-08-14 21:43:30', 9.99, 179.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0443', 'ST02', 'V10', '2025-08-14 07:50:30', '2025-08-14 10:33:30', 19.59, 352.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0444', 'ST01', 'V15', '2025-08-14 09:20:00', '2025-08-14 14:33:00', 37.62, 677.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0445', 'ST05', 'V23', '2025-08-14 17:45:00', '2025-08-14 21:55:00', 30.03, 540.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0446', 'ST02', 'V27', '2025-08-14 12:00:30', '2025-08-14 15:43:30', 26.76, 428.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0447', 'ST05', 'V18', '2025-08-14 11:40:30', '2025-08-14 14:04:30', 17.28, 276.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0448', 'ST03', 'V28', '2025-08-14 09:15:30', '2025-08-14 15:03:30', 41.83, 752.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0449', 'ST03', 'V28', '2025-08-14 10:15:00', '2025-08-14 11:52:00', 11.7, 210.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0450', 'ST03', 'V27', '2025-08-14 13:45:30', '2025-08-14 15:21:30', 11.54, 184.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0451', 'ST03', 'V21', '2025-08-14 19:45:30', '2025-08-14 20:59:30', 8.95, 161.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0452', 'ST01', 'V13', '2025-08-14 14:40:30', '2025-08-14 20:38:30', 43.06, 688.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0453', 'ST03', 'V19', '2025-08-14 06:10:30', '2025-08-14 10:26:30', 30.76, 492.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0454', 'ST03', 'V28', '2025-08-14 08:45:00', '2025-08-14 14:49:00', 43.76, 787.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0455', 'ST02', 'V16', '2025-08-14 14:40:30', '2025-08-14 17:19:30', 19.17, 345.06);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0456', 'ST05', 'V05', '2025-08-14 21:40:00', '2025-08-14 22:44:00', 7.79, 124.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0457', 'ST04', 'V01', '2025-08-15 09:15:30', '2025-08-15 12:33:30', 23.8, 380.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0458', 'ST04', 'V07', '2025-08-15 10:30:00', '2025-08-15 16:04:00', 40.1, 721.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0459', 'ST03', 'V03', '2025-08-15 17:30:00', '2025-08-15 20:20:00', 20.5, 369.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0460', 'ST02', 'V02', '2025-08-15 18:30:00', '2025-08-15 21:39:00', 22.74, 409.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0461', 'ST01', 'V23', '2025-08-15 09:00:00', '2025-08-15 12:25:00', 24.6, 442.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0462', 'ST02', 'V19', '2025-08-15 13:50:00', '2025-08-15 14:42:00', 6.31, 100.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0463', 'ST03', 'V27', '2025-08-15 09:45:00', '2025-08-15 13:10:00', 24.63, 394.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0464', 'ST02', 'V13', '2025-08-15 08:10:00', '2025-08-15 10:41:00', 18.22, 291.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0465', 'ST03', 'V05', '2025-08-15 18:15:00', '2025-08-15 19:27:00', 8.67, 138.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0466', 'ST05', 'V01', '2025-08-15 11:50:30', '2025-08-15 16:34:30', 34.17, 546.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0467', 'ST02', 'V30', '2025-08-15 19:50:00', '2025-08-15 21:08:00', 9.38, 168.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0468', 'ST01', 'V05', '2025-08-15 09:45:30', '2025-08-15 15:48:30', 43.57, 697.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0469', 'ST03', 'V26', '2025-08-15 10:20:30', '2025-08-15 14:39:30', 31.14, 498.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0470', 'ST02', 'V18', '2025-08-15 15:00:30', '2025-08-15 16:56:30', 14.01, 224.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0471', 'ST05', 'V17', '2025-08-15 12:45:30', '2025-08-15 17:05:30', 31.2, 561.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0472', 'ST02', 'V16', '2025-08-15 18:10:00', '2025-08-15 21:42:00', 25.48, 458.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0473', 'ST05', 'V03', '2025-08-15 06:40:30', '2025-08-15 08:12:30', 11.15, 200.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0474', 'ST05', 'V14', '2025-08-15 17:15:30', '2025-08-15 23:15:30', 43.22, 691.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0475', 'ST01', 'V01', '2025-08-15 08:00:30', '2025-08-15 10:00:30', 14.41, 230.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0476', 'ST01', 'V26', '2025-08-15 18:30:30', '2025-08-15 21:37:30', 22.52, 360.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0477', 'ST04', 'V03', '2025-08-15 10:30:00', '2025-08-15 13:00:00', 18.09, 325.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0478', 'ST05', 'V30', '2025-08-15 12:15:30', '2025-08-15 15:11:30', 21.24, 382.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0479', 'ST01', 'V10', '2025-08-15 19:20:00', '2025-08-15 21:29:00', 15.53, 279.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0480', 'ST04', 'V04', '2025-08-15 20:00:30', '2025-08-16 00:26:30', 31.98, 575.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0481', 'ST02', 'V04', '2025-08-15 06:15:00', '2025-08-15 07:58:00', 12.39, 223.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0482', 'ST03', 'V17', '2025-08-15 14:15:30', '2025-08-15 15:46:30', 10.95, 197.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0483', 'ST03', 'V24', '2025-08-15 09:00:30', '2025-08-15 14:12:30', 37.48, 599.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0484', 'ST03', 'V17', '2025-08-15 08:30:00', '2025-08-15 12:01:00', 25.35, 456.3);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0485', 'ST05', 'V12', '2025-08-15 07:50:00', '2025-08-15 10:39:00', 20.34, 366.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0486', 'ST03', 'V25', '2025-08-15 09:10:00', '2025-08-15 14:00:00', 34.89, 628.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0487', 'ST01', 'V02', '2025-08-15 06:20:00', '2025-08-15 09:43:00', 24.4, 439.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0488', 'ST04', 'V30', '2025-08-15 10:15:00', '2025-08-15 14:04:00', 27.56, 496.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0489', 'ST04', 'V08', '2025-08-15 16:20:30', '2025-08-15 22:07:30', 41.72, 667.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0490', 'ST03', 'V09', '2025-08-15 08:40:00', '2025-08-15 12:13:00', 25.58, 460.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0491', 'ST01', 'V06', '2025-08-15 13:00:30', '2025-08-15 14:12:30', 8.69, 156.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0492', 'ST04', 'V28', '2025-08-15 15:30:30', '2025-08-15 16:48:30', 9.37, 168.66);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0493', 'ST04', 'V01', '2025-08-15 17:20:30', '2025-08-15 21:13:30', 27.99, 447.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0494', 'ST03', 'V24', '2025-08-15 13:50:30', '2025-08-15 17:52:30', 29.08, 465.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0495', 'ST04', 'V25', '2025-08-15 12:20:00', '2025-08-15 13:12:00', 6.25, 112.5);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0496', 'ST04', 'V01', '2025-08-15 13:40:00', '2025-08-15 19:39:00', 43.09, 689.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0497', 'ST04', 'V28', '2025-08-16 15:10:00', '2025-08-16 18:52:00', 26.66, 479.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0498', 'ST02', 'V14', '2025-08-16 21:00:00', '2025-08-17 01:41:00', 33.75, 540.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0499', 'ST01', 'V02', '2025-08-16 13:45:30', '2025-08-16 17:04:30', 23.88, 429.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0500', 'ST01', 'V19', '2025-08-16 09:15:30', '2025-08-16 10:29:30', 8.92, 142.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0501', 'ST05', 'V02', '2025-08-16 19:15:00', '2025-08-16 21:39:00', 17.38, 312.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0502', 'ST03', 'V30', '2025-08-16 18:40:30', '2025-08-16 21:57:30', 23.66, 425.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0503', 'ST02', 'V03', '2025-08-16 12:15:00', '2025-08-16 13:55:00', 12.06, 217.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0504', 'ST02', 'V15', '2025-08-16 20:40:30', '2025-08-16 22:09:30', 10.71, 192.78);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0505', 'ST03', 'V25', '2025-08-16 12:50:30', '2025-08-16 16:10:30', 24.07, 433.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0506', 'ST01', 'V03', '2025-08-16 11:30:00', '2025-08-16 13:29:00', 14.39, 259.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0507', 'ST03', 'V05', '2025-08-16 08:20:30', '2025-08-16 11:18:30', 21.45, 343.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0508', 'ST01', 'V22', '2025-08-16 15:30:00', '2025-08-16 16:30:00', 7.21, 115.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0509', 'ST04', 'V28', '2025-08-16 20:20:00', '2025-08-16 23:40:00', 24.02, 432.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0510', 'ST02', 'V04', '2025-08-16 06:00:00', '2025-08-16 07:32:00', 11.1, 199.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0511', 'ST04', 'V12', '2025-08-16 08:30:00', '2025-08-16 09:27:00', 6.85, 123.3);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0512', 'ST01', 'V07', '2025-08-16 20:15:00', '2025-08-17 01:59:00', 41.3, 743.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0513', 'ST03', 'V04', '2025-08-16 07:50:00', '2025-08-16 09:34:00', 12.55, 225.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0514', 'ST05', 'V14', '2025-08-16 18:50:00', '2025-08-16 21:44:00', 20.93, 334.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0515', 'ST04', 'V06', '2025-08-16 17:20:00', '2025-08-16 19:39:00', 16.72, 300.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0516', 'ST04', 'V29', '2025-08-16 10:00:00', '2025-08-16 14:20:00', 31.24, 499.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0517', 'ST04', 'V29', '2025-08-17 21:00:00', '2025-08-17 23:20:00', 16.91, 270.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0518', 'ST02', 'V14', '2025-08-17 12:20:00', '2025-08-17 18:31:00', 44.59, 713.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0519', 'ST03', 'V16', '2025-08-17 21:40:30', '2025-08-18 00:36:30', 21.15, 380.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0520', 'ST02', 'V01', '2025-08-17 16:20:00', '2025-08-17 22:01:00', 40.93, 654.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0521', 'ST03', 'V02', '2025-08-17 21:40:00', '2025-08-18 03:46:00', 43.99, 791.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0522', 'ST01', 'V08', '2025-08-17 13:30:00', '2025-08-17 18:28:00', 35.8, 572.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0523', 'ST02', 'V19', '2025-08-17 18:40:00', '2025-08-17 20:27:00', 12.87, 205.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0524', 'ST05', 'V11', '2025-08-17 17:00:30', '2025-08-17 22:57:30', 42.95, 687.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0525', 'ST05', 'V05', '2025-08-17 12:50:30', '2025-08-17 14:37:30', 12.85, 205.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0526', 'ST01', 'V03', '2025-08-17 07:20:00', '2025-08-17 08:16:00', 6.78, 122.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0527', 'ST04', 'V01', '2025-08-17 16:20:00', '2025-08-17 19:00:00', 19.29, 308.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0528', 'ST02', 'V30', '2025-08-17 16:00:00', '2025-08-17 17:38:00', 11.76, 211.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0529', 'ST02', 'V25', '2025-08-17 09:40:00', '2025-08-17 12:31:00', 20.57, 370.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0530', 'ST04', 'V19', '2025-08-17 09:40:30', '2025-08-17 12:14:30', 18.58, 297.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0531', 'ST02', 'V24', '2025-08-17 19:50:30', '2025-08-17 21:36:30', 12.79, 204.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0532', 'ST05', 'V23', '2025-08-17 17:20:00', '2025-08-17 20:13:00', 20.76, 373.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0533', 'ST03', 'V05', '2025-08-17 11:00:30', '2025-08-17 16:26:30', 39.18, 626.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0534', 'ST05', 'V02', '2025-08-17 11:40:00', '2025-08-17 15:57:00', 30.95, 557.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0535', 'ST01', 'V30', '2025-08-17 21:15:30', '2025-08-18 02:07:30', 35.07, 631.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0536', 'ST02', 'V12', '2025-08-17 16:15:00', '2025-08-17 21:32:00', 38.04, 684.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0537', 'ST03', 'V15', '2025-08-17 06:30:00', '2025-08-17 08:41:00', 15.73, 283.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0538', 'ST01', 'V12', '2025-08-17 14:10:00', '2025-08-17 15:15:00', 7.88, 141.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0539', 'ST04', 'V24', '2025-08-17 19:15:30', '2025-08-17 22:45:30', 25.23, 403.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0540', 'ST04', 'V12', '2025-08-17 18:10:30', '2025-08-17 23:16:30', 36.76, 661.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0541', 'ST05', 'V21', '2025-08-17 13:15:30', '2025-08-17 14:28:30', 8.87, 159.66);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0542', 'ST01', 'V10', '2025-08-17 06:40:30', '2025-08-17 12:39:30', 43.11, 775.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0543', 'ST01', 'V11', '2025-08-17 11:45:00', '2025-08-17 16:32:00', 34.55, 552.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0544', 'ST05', 'V29', '2025-08-17 08:40:30', '2025-08-17 13:18:30', 33.48, 535.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0545', 'ST04', 'V21', '2025-08-17 11:45:00', '2025-08-17 12:52:00', 8.09, 145.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0546', 'ST03', 'V07', '2025-08-17 12:45:30', '2025-08-17 17:09:30', 31.76, 571.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0547', 'ST03', 'V08', '2025-08-17 09:00:30', '2025-08-17 12:55:30', 28.3, 452.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0548', 'ST04', 'V05', '2025-08-17 07:40:00', '2025-08-17 10:49:00', 22.68, 362.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0549', 'ST03', 'V27', '2025-08-17 21:20:00', '2025-08-17 22:18:00', 7.0, 112.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0550', 'ST02', 'V21', '2025-08-17 15:10:30', '2025-08-17 20:34:30', 38.91, 700.38);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0551', 'ST03', 'V26', '2025-08-17 18:50:30', '2025-08-18 00:30:30', 40.9, 654.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0552', 'ST01', 'V21', '2025-08-18 18:15:30', '2025-08-18 23:52:30', 40.53, 729.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0553', 'ST03', 'V06', '2025-08-18 20:00:30', '2025-08-18 23:12:30', 23.15, 416.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0554', 'ST03', 'V08', '2025-08-18 14:00:00', '2025-08-18 18:54:00', 35.34, 565.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0555', 'ST01', 'V03', '2025-08-18 17:45:00', '2025-08-18 21:34:00', 27.59, 496.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0556', 'ST04', 'V27', '2025-08-18 19:50:00', '2025-08-18 23:14:00', 24.57, 393.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0557', 'ST01', 'V13', '2025-08-18 07:15:00', '2025-08-18 13:13:00', 43.02, 688.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0558', 'ST04', 'V06', '2025-08-18 11:20:00', '2025-08-18 12:51:00', 10.92, 196.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0559', 'ST04', 'V03', '2025-08-18 19:20:00', '2025-08-19 00:41:00', 38.53, 693.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0560', 'ST03', 'V11', '2025-08-18 08:10:30', '2025-08-18 12:00:30', 27.7, 443.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0561', 'ST05', 'V11', '2025-08-18 14:50:00', '2025-08-18 19:55:00', 36.68, 586.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0562', 'ST05', 'V19', '2025-08-18 19:10:30', '2025-08-18 20:48:30', 11.84, 189.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0563', 'ST05', 'V19', '2025-08-18 09:10:00', '2025-08-18 14:15:00', 36.64, 586.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0564', 'ST05', 'V29', '2025-08-18 17:45:30', '2025-08-18 20:39:30', 20.94, 335.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0565', 'ST04', 'V19', '2025-08-18 21:00:00', '2025-08-18 23:19:00', 16.74, 267.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0566', 'ST02', 'V20', '2025-08-18 18:00:30', '2025-08-18 23:39:30', 40.69, 732.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0567', 'ST03', 'V23', '2025-08-18 13:00:30', '2025-08-18 18:49:30', 41.91, 754.38);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0568', 'ST03', 'V01', '2025-08-18 16:30:30', '2025-08-18 18:51:30', 16.93, 270.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0569', 'ST04', 'V28', '2025-08-18 09:20:00', '2025-08-18 11:47:00', 17.72, 318.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0570', 'ST04', 'V25', '2025-08-18 16:30:30', '2025-08-18 20:36:30', 29.59, 532.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0571', 'ST01', 'V07', '2025-08-18 20:20:30', '2025-08-19 01:10:30', 34.9, 628.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0572', 'ST05', 'V28', '2025-08-18 17:00:00', '2025-08-18 18:11:00', 8.56, 154.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0573', 'ST05', 'V13', '2025-08-18 10:00:00', '2025-08-18 11:52:00', 13.52, 216.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0574', 'ST02', 'V27', '2025-08-18 07:20:00', '2025-08-18 10:38:00', 23.8, 380.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0575', 'ST03', 'V23', '2025-08-18 12:30:30', '2025-08-18 17:47:30', 38.12, 686.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0576', 'ST05', 'V13', '2025-08-18 09:00:00', '2025-08-18 11:51:00', 20.53, 328.48);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0577', 'ST05', 'V15', '2025-08-18 11:50:30', '2025-08-18 14:31:30', 19.43, 349.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0578', 'ST03', 'V24', '2025-08-18 08:30:00', '2025-08-18 11:25:00', 21.08, 337.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0579', 'ST02', 'V28', '2025-08-18 12:20:00', '2025-08-18 16:50:00', 32.43, 583.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0580', 'ST04', 'V17', '2025-08-19 06:00:30', '2025-08-19 11:46:30', 41.55, 747.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0581', 'ST02', 'V20', '2025-08-19 06:20:30', '2025-08-19 10:27:30', 29.73, 535.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0582', 'ST03', 'V23', '2025-08-19 14:45:30', '2025-08-19 20:11:30', 39.21, 705.78);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0583', 'ST04', 'V09', '2025-08-19 12:50:30', '2025-08-19 17:20:30', 32.41, 583.38);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0584', 'ST05', 'V13', '2025-08-19 09:00:30', '2025-08-19 12:52:30', 27.9, 446.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0585', 'ST05', 'V20', '2025-08-19 15:30:00', '2025-08-19 18:56:00', 24.79, 446.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0586', 'ST03', 'V09', '2025-08-19 16:30:30', '2025-08-19 20:53:30', 31.59, 568.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0587', 'ST03', 'V07', '2025-08-19 10:20:00', '2025-08-19 15:31:00', 37.41, 673.38);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0588', 'ST05', 'V13', '2025-08-19 16:15:00', '2025-08-19 20:38:00', 31.56, 504.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0589', 'ST03', 'V09', '2025-08-19 19:45:30', '2025-08-20 00:34:30', 34.73, 625.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0590', 'ST05', 'V23', '2025-08-19 12:40:00', '2025-08-19 17:13:00', 32.77, 589.86);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0591', 'ST04', 'V30', '2025-08-19 17:30:00', '2025-08-19 22:53:00', 38.78, 698.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0592', 'ST05', 'V06', '2025-08-19 15:10:30', '2025-08-19 16:41:30', 10.99, 197.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0593', 'ST03', 'V24', '2025-08-19 11:40:00', '2025-08-19 13:42:00', 14.67, 234.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0594', 'ST02', 'V24', '2025-08-19 15:45:30', '2025-08-19 18:35:30', 20.5, 328.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0595', 'ST05', 'V10', '2025-08-19 20:10:30', '2025-08-19 21:17:30', 8.09, 145.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0596', 'ST05', 'V19', '2025-08-19 08:50:00', '2025-08-19 12:22:00', 25.52, 408.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0597', 'ST04', 'V17', '2025-08-19 15:45:00', '2025-08-19 21:18:00', 39.96, 719.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0598', 'ST02', 'V05', '2025-08-19 12:40:30', '2025-08-19 18:50:30', 44.5, 712.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0599', 'ST04', 'V05', '2025-08-19 16:15:00', '2025-08-19 19:43:00', 25.02, 400.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0600', 'ST02', 'V11', '2025-08-19 07:00:30', '2025-08-19 09:18:30', 16.67, 266.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0601', 'ST02', 'V19', '2025-08-19 11:50:00', '2025-08-19 13:22:00', 11.05, 176.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0602', 'ST04', 'V21', '2025-08-19 19:45:30', '2025-08-20 01:48:30', 43.65, 785.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0603', 'ST04', 'V01', '2025-08-19 07:20:30', '2025-08-19 13:18:30', 43.05, 688.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0604', 'ST03', 'V25', '2025-08-19 12:00:00', '2025-08-19 16:13:00', 30.44, 547.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0605', 'ST02', 'V08', '2025-08-19 17:30:00', '2025-08-19 18:53:00', 10.01, 160.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0606', 'ST05', 'V19', '2025-08-19 15:15:00', '2025-08-19 20:32:00', 38.13, 610.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0607', 'ST03', 'V10', '2025-08-19 20:40:30', '2025-08-20 02:18:30', 40.63, 731.34);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0608', 'ST03', 'V29', '2025-08-20 21:40:00', '2025-08-20 23:23:00', 12.43, 198.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0609', 'ST04', 'V01', '2025-08-20 13:20:00', '2025-08-20 15:18:00', 14.24, 227.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0610', 'ST01', 'V19', '2025-08-20 11:10:30', '2025-08-20 15:51:30', 33.73, 539.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0611', 'ST01', 'V13', '2025-08-20 14:00:00', '2025-08-20 18:25:00', 31.82, 509.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0612', 'ST01', 'V02', '2025-08-20 09:45:30', '2025-08-20 12:38:30', 20.83, 374.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0613', 'ST05', 'V09', '2025-08-20 21:15:00', '2025-08-21 01:50:00', 33.11, 595.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0614', 'ST01', 'V10', '2025-08-20 19:10:30', '2025-08-20 23:22:30', 30.29, 545.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0615', 'ST02', 'V14', '2025-08-20 09:10:30', '2025-08-20 10:37:30', 10.45, 167.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0616', 'ST01', 'V16', '2025-08-20 12:20:30', '2025-08-20 17:40:30', 38.43, 691.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0617', 'ST02', 'V12', '2025-08-20 19:30:00', '2025-08-20 20:32:00', 7.54, 135.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0618', 'ST04', 'V30', '2025-08-20 12:50:30', '2025-08-20 14:56:30', 15.15, 272.7);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0619', 'ST01', 'V22', '2025-08-20 08:10:30', '2025-08-20 09:48:30', 11.82, 189.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0620', 'ST01', 'V25', '2025-08-20 08:10:30', '2025-08-20 12:29:30', 31.13, 560.34);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0621', 'ST04', 'V10', '2025-08-20 14:50:00', '2025-08-20 16:12:00', 9.89, 178.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0622', 'ST02', 'V28', '2025-08-20 07:30:30', '2025-08-20 12:40:30', 37.26, 670.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0623', 'ST03', 'V14', '2025-08-20 09:10:00', '2025-08-20 10:03:00', 6.38, 102.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0624', 'ST02', 'V22', '2025-08-20 11:40:30', '2025-08-20 17:20:30', 40.89, 654.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0625', 'ST05', 'V09', '2025-08-20 08:40:30', '2025-08-20 10:29:30', 13.13, 236.34);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0626', 'ST04', 'V13', '2025-08-20 20:30:30', '2025-08-21 01:04:30', 32.91, 526.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0627', 'ST04', 'V26', '2025-08-20 19:15:00', '2025-08-20 20:48:00', 11.17, 178.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0628', 'ST01', 'V28', '2025-08-20 11:10:30', '2025-08-20 16:56:30', 41.54, 747.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0629', 'ST04', 'V26', '2025-08-20 20:15:30', '2025-08-21 01:18:30', 36.39, 582.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0630', 'ST05', 'V01', '2025-08-20 10:50:30', '2025-08-20 12:16:30', 10.4, 166.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0631', 'ST04', 'V15', '2025-08-20 07:10:30', '2025-08-20 11:32:30', 31.54, 567.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0632', 'ST05', 'V25', '2025-08-21 13:40:00', '2025-08-21 16:50:00', 22.88, 411.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0633', 'ST02', 'V16', '2025-08-21 17:45:00', '2025-08-21 23:07:00', 38.72, 696.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0634', 'ST05', 'V29', '2025-08-21 07:00:00', '2025-08-21 10:34:00', 25.72, 411.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0635', 'ST04', 'V28', '2025-08-21 21:15:00', '2025-08-22 02:09:00', 35.31, 635.58);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0636', 'ST03', 'V08', '2025-08-21 16:30:00', '2025-08-21 20:04:00', 25.77, 412.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0637', 'ST05', 'V21', '2025-08-21 18:45:00', '2025-08-21 20:00:00', 9.07, 163.26);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0638', 'ST04', 'V26', '2025-08-21 20:10:30', '2025-08-21 23:25:30', 23.44, 375.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0639', 'ST01', 'V16', '2025-08-21 06:10:30', '2025-08-21 09:14:30', 22.08, 397.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0640', 'ST05', 'V18', '2025-08-21 06:10:30', '2025-08-21 11:49:30', 40.71, 651.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0641', 'ST05', 'V07', '2025-08-21 20:40:30', '2025-08-22 01:58:30', 38.19, 687.42);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0642', 'ST02', 'V28', '2025-08-21 20:40:30', '2025-08-22 01:22:30', 33.95, 611.1);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0643', 'ST03', 'V23', '2025-08-21 20:10:00', '2025-08-22 01:06:00', 35.61, 640.98);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0644', 'ST02', 'V01', '2025-08-21 16:40:30', '2025-08-21 20:28:30', 27.36, 437.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0645', 'ST03', 'V23', '2025-08-21 09:00:00', '2025-08-21 12:30:00', 25.2, 453.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0646', 'ST04', 'V04', '2025-08-21 14:20:00', '2025-08-21 15:49:00', 10.71, 192.78);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0647', 'ST04', 'V07', '2025-08-21 20:20:30', '2025-08-21 21:44:30', 10.2, 183.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0648', 'ST04', 'V02', '2025-08-21 09:50:30', '2025-08-21 14:13:30', 31.68, 570.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0649', 'ST05', 'V05', '2025-08-21 21:00:00', '2025-08-22 00:49:00', 27.58, 441.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0650', 'ST04', 'V27', '2025-08-21 21:15:00', '2025-08-22 02:02:00', 34.49, 551.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0651', 'ST02', 'V04', '2025-08-21 18:40:30', '2025-08-21 21:46:30', 22.33, 401.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0652', 'ST02', 'V09', '2025-08-22 18:40:30', '2025-08-22 21:57:30', 23.66, 425.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0653', 'ST02', 'V05', '2025-08-22 19:30:30', '2025-08-23 00:11:30', 33.76, 540.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0654', 'ST05', 'V21', '2025-08-22 12:20:00', '2025-08-22 16:32:00', 30.34, 546.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0655', 'ST03', 'V22', '2025-08-22 17:15:00', '2025-08-22 20:48:00', 25.65, 410.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0656', 'ST03', 'V23', '2025-08-22 09:40:30', '2025-08-22 13:39:30', 28.73, 517.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0657', 'ST04', 'V22', '2025-08-22 15:45:00', '2025-08-22 19:24:00', 26.39, 422.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0658', 'ST01', 'V13', '2025-08-22 10:00:00', '2025-08-22 11:55:00', 13.8, 220.8);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0659', 'ST02', 'V10', '2025-08-22 14:15:00', '2025-08-22 18:49:00', 32.93, 592.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0660', 'ST03', 'V07', '2025-08-22 07:40:30', '2025-08-22 09:03:30', 10.0, 180.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0661', 'ST05', 'V28', '2025-08-22 13:45:00', '2025-08-22 17:21:00', 25.93, 466.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0662', 'ST03', 'V23', '2025-08-22 07:45:30', '2025-08-22 10:50:30', 22.25, 400.5);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0663', 'ST03', 'V18', '2025-08-22 07:00:30', '2025-08-22 08:56:30', 13.92, 222.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0664', 'ST04', 'V27', '2025-08-22 13:40:00', '2025-08-22 18:42:00', 36.27, 580.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0665', 'ST02', 'V10', '2025-08-22 20:15:00', '2025-08-22 22:05:00', 13.29, 239.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0666', 'ST02', 'V24', '2025-08-22 09:45:00', '2025-08-22 12:54:00', 22.71, 363.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0667', 'ST05', 'V09', '2025-08-22 10:15:30', '2025-08-22 11:06:30', 6.22, 111.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0668', 'ST04', 'V23', '2025-08-22 10:00:00', '2025-08-22 15:51:00', 42.22, 759.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0669', 'ST05', 'V02', '2025-08-22 15:50:30', '2025-08-22 17:03:30', 8.84, 159.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0670', 'ST03', 'V17', '2025-08-22 13:15:00', '2025-08-22 18:20:00', 36.66, 659.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0671', 'ST02', 'V14', '2025-08-22 18:10:30', '2025-08-22 20:11:30', 14.63, 234.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0672', 'ST02', 'V22', '2025-08-22 16:40:30', '2025-08-22 19:05:30', 17.45, 279.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0673', 'ST05', 'V17', '2025-08-22 21:00:00', '2025-08-23 01:27:00', 32.09, 577.62);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0674', 'ST04', 'V08', '2025-08-22 13:00:30', '2025-08-22 15:53:30', 20.87, 333.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0675', 'ST01', 'V13', '2025-08-22 14:30:00', '2025-08-22 20:16:00', 41.54, 664.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0676', 'ST03', 'V17', '2025-08-22 20:50:00', '2025-08-22 23:16:00', 17.56, 316.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0677', 'ST02', 'V11', '2025-08-22 08:10:00', '2025-08-22 14:15:00', 43.89, 702.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0678', 'ST05', 'V18', '2025-08-22 06:10:00', '2025-08-22 10:37:00', 32.14, 514.24);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0679', 'ST02', 'V28', '2025-08-22 19:10:00', '2025-08-22 22:54:00', 26.97, 485.46);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0680', 'ST04', 'V21', '2025-08-22 08:15:00', '2025-08-22 11:34:00', 23.91, 430.38);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0681', 'ST03', 'V02', '2025-08-22 08:10:00', '2025-08-22 09:57:00', 12.94, 232.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0682', 'ST03', 'V18', '2025-08-22 08:20:30', '2025-08-22 11:22:30', 21.9, 350.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0683', 'ST04', 'V21', '2025-08-22 18:45:30', '2025-08-22 19:40:30', 6.66, 119.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0684', 'ST01', 'V18', '2025-08-22 06:10:00', '2025-08-22 10:47:00', 33.33, 533.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0685', 'ST01', 'V12', '2025-08-22 09:30:30', '2025-08-22 13:37:30', 29.66, 533.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0686', 'ST03', 'V25', '2025-08-22 20:45:30', '2025-08-23 02:02:30', 38.06, 685.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0687', 'ST01', 'V16', '2025-08-22 11:20:00', '2025-08-22 16:12:00', 35.12, 632.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0688', 'ST05', 'V10', '2025-08-22 10:30:30', '2025-08-22 16:31:30', 43.34, 780.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0689', 'ST01', 'V18', '2025-08-22 10:10:00', '2025-08-22 11:01:00', 6.2, 99.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0690', 'ST05', 'V13', '2025-08-22 08:30:00', '2025-08-22 13:23:00', 35.18, 562.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0691', 'ST02', 'V14', '2025-08-23 10:15:00', '2025-08-23 12:16:00', 14.61, 233.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0692', 'ST03', 'V07', '2025-08-23 09:15:00', '2025-08-23 14:41:00', 39.2, 705.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0693', 'ST05', 'V15', '2025-08-23 08:30:00', '2025-08-23 10:41:00', 15.78, 284.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0694', 'ST02', 'V24', '2025-08-23 21:40:30', '2025-08-23 23:11:30', 11.0, 176.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0695', 'ST02', 'V04', '2025-08-23 15:10:00', '2025-08-23 17:43:00', 18.39, 331.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0696', 'ST04', 'V11', '2025-08-23 15:15:30', '2025-08-23 20:27:30', 37.5, 600.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0697', 'ST04', 'V06', '2025-08-23 06:40:00', '2025-08-23 11:45:00', 36.64, 659.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0698', 'ST04', 'V09', '2025-08-23 17:15:30', '2025-08-23 22:50:30', 40.24, 724.32);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0699', 'ST04', 'V15', '2025-08-23 17:30:30', '2025-08-23 21:19:30', 27.52, 495.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0700', 'ST02', 'V21', '2025-08-23 08:30:00', '2025-08-23 14:09:00', 40.76, 733.68);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0701', 'ST02', 'V09', '2025-08-23 08:10:00', '2025-08-23 13:36:00', 39.13, 704.34);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0702', 'ST01', 'V27', '2025-08-23 18:20:00', '2025-08-23 22:09:00', 27.51, 440.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0703', 'ST05', 'V29', '2025-08-23 21:15:30', '2025-08-24 00:12:30', 21.31, 340.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0704', 'ST05', 'V24', '2025-08-23 15:15:30', '2025-08-23 18:47:30', 25.54, 408.64);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0705', 'ST01', 'V13', '2025-08-23 17:00:00', '2025-08-23 22:25:00', 39.07, 625.12);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0706', 'ST05', 'V22', '2025-08-23 11:15:30', '2025-08-23 12:56:30', 12.21, 195.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0707', 'ST05', 'V19', '2025-08-23 10:50:30', '2025-08-23 11:53:30', 7.58, 121.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0708', 'ST04', 'V08', '2025-08-23 08:30:30', '2025-08-23 10:36:30', 15.13, 242.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0709', 'ST02', 'V17', '2025-08-23 17:45:30', '2025-08-23 23:33:30', 41.8, 752.4);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0710', 'ST01', 'V02', '2025-08-23 16:10:30', '2025-08-23 21:31:30', 38.56, 694.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0711', 'ST03', 'V19', '2025-08-23 11:45:30', '2025-08-23 14:33:30', 20.25, 324.0);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0712', 'ST01', 'V17', '2025-08-23 14:45:00', '2025-08-23 18:22:00', 26.14, 470.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0713', 'ST03', 'V27', '2025-08-23 17:50:30', '2025-08-23 23:28:30', 40.6, 649.6);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0714', 'ST01', 'V17', '2025-08-23 10:50:00', '2025-08-23 12:54:00', 14.97, 269.46);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0715', 'ST05', 'V21', '2025-08-23 14:20:00', '2025-08-23 16:10:00', 13.29, 239.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0716', 'ST03', 'V20', '2025-08-23 09:20:30', '2025-08-23 14:33:30', 37.64, 677.52);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0717', 'ST01', 'V16', '2025-08-23 21:50:00', '2025-08-24 01:52:00', 29.04, 522.72);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0718', 'ST04', 'V01', '2025-08-23 13:00:00', '2025-08-23 16:56:00', 28.37, 453.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0719', 'ST02', 'V05', '2025-08-23 07:15:00', '2025-08-23 08:59:00', 12.49, 199.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0720', 'ST02', 'V17', '2025-08-23 18:00:30', '2025-08-23 23:57:30', 42.94, 772.92);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0721', 'ST02', 'V15', '2025-08-23 21:50:00', '2025-08-23 23:51:00', 14.56, 262.08);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0722', 'ST05', 'V05', '2025-08-24 11:30:00', '2025-08-24 16:15:00', 34.24, 547.84);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0723', 'ST03', 'V30', '2025-08-24 20:10:00', '2025-08-24 23:02:00', 20.75, 373.5);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0724', 'ST02', 'V04', '2025-08-24 06:20:30', '2025-08-24 11:38:30', 38.23, 688.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0725', 'ST05', 'V04', '2025-08-24 11:50:00', '2025-08-24 17:25:00', 40.23, 724.14);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0726', 'ST05', 'V17', '2025-08-24 09:10:30', '2025-08-24 13:34:30', 31.72, 570.96);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0727', 'ST05', 'V18', '2025-08-24 06:45:30', '2025-08-24 09:35:30', 20.44, 327.04);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0728', 'ST01', 'V23', '2025-08-24 19:20:30', '2025-08-25 00:26:30', 36.79, 662.22);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0729', 'ST04', 'V12', '2025-08-24 09:45:00', '2025-08-24 11:57:00', 15.93, 286.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0730', 'ST02', 'V30', '2025-08-24 08:30:30', '2025-08-24 10:43:30', 16.05, 288.9);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0731', 'ST01', 'V23', '2025-08-24 06:10:00', '2025-08-24 09:01:00', 20.63, 371.34);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0732', 'ST02', 'V23', '2025-08-24 16:45:30', '2025-08-24 18:09:30', 10.16, 182.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0733', 'ST04', 'V21', '2025-08-24 14:30:30', '2025-08-24 18:23:30', 28.02, 504.36);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0734', 'ST05', 'V09', '2025-08-24 18:20:30', '2025-08-24 22:09:30', 27.53, 495.54);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0735', 'ST05', 'V16', '2025-08-24 11:40:30', '2025-08-24 13:52:30', 15.9, 286.2);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0736', 'ST03', 'V19', '2025-08-24 17:45:00', '2025-08-24 23:12:00', 39.34, 629.44);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0737', 'ST01', 'V24', '2025-08-24 13:50:00', '2025-08-24 15:12:00', 9.91, 158.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0738', 'ST05', 'V13', '2025-08-24 16:00:00', '2025-08-24 18:56:00', 21.18, 338.88);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0739', 'ST01', 'V26', '2025-08-24 08:15:30', '2025-08-24 14:05:30', 42.11, 673.76);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0740', 'ST04', 'V03', '2025-08-24 08:30:00', '2025-08-24 11:20:00', 20.46, 368.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0741', 'ST05', 'V02', '2025-08-24 18:45:30', '2025-08-24 23:26:30', 33.75, 607.5);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0742', 'ST05', 'V02', '2025-08-24 11:50:30', '2025-08-24 12:43:30', 6.42, 115.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0743', 'ST05', 'V10', '2025-08-24 12:00:00', '2025-08-24 16:09:00', 29.99, 539.82);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0744', 'ST01', 'V12', '2025-08-24 13:00:00', '2025-08-24 14:18:00', 9.39, 169.02);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0745', 'ST03', 'V25', '2025-08-24 18:40:30', '2025-08-24 21:41:30', 21.81, 392.58);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0746', 'ST02', 'V17', '2025-08-24 06:10:00', '2025-08-24 09:58:00', 27.43, 493.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0747', 'ST05', 'V30', '2025-08-24 17:40:30', '2025-08-24 19:43:30', 14.83, 266.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0748', 'ST02', 'V15', '2025-08-24 18:00:30', '2025-08-24 19:46:30', 12.83, 230.94);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0749', 'ST05', 'V04', '2025-08-24 08:30:30', '2025-08-24 14:27:30', 42.93, 772.74);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0750', 'ST05', 'V09', '2025-08-24 14:50:30', '2025-08-24 18:43:30', 27.96, 503.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0751', 'ST02', 'V25', '2025-08-24 16:50:30', '2025-08-24 22:31:30', 40.96, 737.28);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0752', 'ST01', 'V16', '2025-08-24 09:30:00', '2025-08-24 12:24:00', 20.92, 376.56);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0753', 'ST02', 'V22', '2025-08-24 13:40:30', '2025-08-24 19:40:30', 43.26, 692.16);
INSERT INTO charging_sessions (session_id, station_id, vehicle_id, start_time, end_time, energy_used_kwh, cost) VALUES ('S0754', 'ST05', 'V18', '2025-08-24 06:30:00', '2025-08-24 08:53:00', 17.2, 275.2);

-- =====================
-- Analytics & Useful Views
-- =====================

-- View: sessions per station
DROP VIEW IF EXISTS v_station_usage;
CREATE VIEW v_station_usage AS
SELECT s.station_id, st.location, COUNT(*) AS total_sessions, SUM(cs.energy_used_kwh) AS total_kwh, SUM(cs.cost) AS revenue
FROM charging_sessions cs
JOIN stations st ON cs.station_id = st.station_id
JOIN stations s ON s.station_id = cs.station_id
GROUP BY s.station_id, st.location;

-- Peak charging hours
-- (PostgreSQL EXTRACT)
DROP VIEW IF EXISTS v_peak_hours;
CREATE VIEW v_peak_hours AS
SELECT HOUR(start_time) AS hour, COUNT(*) AS sessions
FROM charging_sessions
GROUP BY hour
ORDER BY sessions DESC;

-- Revenue per station
DROP VIEW IF EXISTS v_station_revenue;
CREATE VIEW v_station_revenue AS
SELECT st.station_id, st.location, SUM(cs.cost) AS total_revenue
FROM charging_sessions cs
JOIN stations st ON cs.station_id = st.station_id
GROUP BY st.station_id, st.location
ORDER BY total_revenue DESC;

-- Avg energy per vehicle type
DROP VIEW IF EXISTS v_energy_by_vehicle_type;
CREATE VIEW v_energy_by_vehicle_type AS
SELECT v.vehicle_type, AVG(cs.energy_used_kwh) AS avg_energy_kwh
FROM charging_sessions cs
JOIN vehicles v ON cs.vehicle_id = v.vehicle_id
GROUP BY v.vehicle_type
ORDER BY avg_energy_kwh DESC;

-- Top 10 most active users by sessions
DROP VIEW IF EXISTS v_top_users;
CREATE VIEW v_top_users AS
SELECT u.user_id, u.name, COUNT(*) AS sessions, SUM(cs.energy_used_kwh) AS total_kwh, SUM(cs.cost) AS total_spend
FROM charging_sessions cs
JOIN vehicles v ON cs.vehicle_id = v.vehicle_id
JOIN users u ON v.user_id = u.user_id
GROUP BY u.user_id, u.name
ORDER BY sessions DESC
LIMIT 10;

-- =====================
-- Example ad-hoc queries (run as needed)
-- =====================

-- 1) Station utilization overview
SELECT * FROM v_station_usage ORDER BY total_sessions DESC;

-- 2) Peak hour analysis
SELECT * FROM v_peak_hours LIMIT 5;

-- 3) Station-wise revenue
SELECT * FROM v_station_revenue;

-- 4) Energy usage by vehicle type
SELECT * FROM v_energy_by_vehicle_type;

-- 5) Subscription vs pay-per-use revenue split
SELECT u.subscription_type, SUM(cs.cost) AS revenue
FROM charging_sessions cs
JOIN vehicles v ON cs.vehicle_id = v.vehicle_id
JOIN users u ON v.user_id = u.user_id
GROUP BY u.subscription_type;

-- 6) Daily sessions trend
SELECT DATE(start_time) AS day, COUNT(*) AS sessions, SUM(energy_used_kwh) AS kwh
FROM charging_sessions
GROUP BY day
ORDER BY day;
