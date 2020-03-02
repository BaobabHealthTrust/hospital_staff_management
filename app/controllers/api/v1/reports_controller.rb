module Api
    module V1
        class ReportsController < ApplicationController
        
            def staff_patient_allocation_count
                utils = UtilsController.new
                sql_query = "SELECT u.username, u.date_of_birth, u.email, u.role_id,
                             r.role_name, count(a.id) as count
                             FROM users u
                             INNER JOIN roles r ON r.id = u.role_id
                             INNER JOIN allocations a ON  a.assigned_to = u.id"

                if params[:role]
                    role = params[:role]
                    sql_query = sql_query + " INNER JOIN roles r on r.id = u.role_id WHERE r.role_name = '#{role}'"
                end

                sql_query = utils.construct_date_query(sql_query, 'a', params)
                sql_query = add_group_by(sql_query, "u.username")   
                json_response(User.find_by_sql(sql_query))
            end

            def add_group_by(sql_query, group_by_string)
                sql_query = sql_query + " GROUP BY #{group_by_string}"
            end

            def get_patient_encounters_by_staff
                utils = UtilsController.new
                staff_id = params[:staff_id]
                sql = "SELECT p.first_name, p.middle_name, p.family_name,
                       p.date_of_birth, p.email, p.address, p.phone_number, p.gender,
                       e.encounter_type, e.weight, e.height, e.temperature, e.bp,
                       e.patient_id, roles.*
                       FROM patients p
                       INNER JOIN encounters e on e.patient_id = p.id
                       INNER JOIN allocations a ON e.id  = a.assigned_to
                       WHERE a.assigned_to = #{staff_id}"
                sql = utils.construct_date_query(sql, 'e', params)
                json_response(Patient.find_by_sql(sql))
            end        
        end
    end
end
