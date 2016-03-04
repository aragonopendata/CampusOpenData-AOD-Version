import psycopg2

CAMPUS_OPEN_DATA_HOST						= 'localhost'
CAMPUS_OPEN_DATA_DB_NAME 				= 'campusopendatadb'
CAMPUS_OPEN_DATA_PORT						= '5432'
CAMPUS_OPEN_DATA_USER 					= 'user_campusopendata'
CAMPUS_OPEN_DATA_PASSWORD				= 'C0ntr4$3n4_d3_c4mpU$0p3nD4t4'

CAMPUS_OPEN_DATA_CONEXION_BBDD	= "host='"+CAMPUS_OPEN_DATA_HOST+"' dbname='"+CAMPUS_OPEN_DATA_DB_NAME+"'  port='"+CAMPUS_OPEN_DATA_PORT+"' user='"+CAMPUS_OPEN_DATA_USER+"' password='"+CAMPUS_OPEN_DATA_PASSWORD+"'"

def conexion():
	return psycopg2.connect(CAMPUS_OPEN_DATA_CONEXION_BBDD)
