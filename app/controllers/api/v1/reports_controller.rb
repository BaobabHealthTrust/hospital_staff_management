module Api
    module V1
        class ReportsController < ApplicationController
        
            def staff_patient_allocation_count
                sql_query = "SELECT u.username, u.date_of_birth, u.email, u.role_id, count(a.id) as count
                             FROM users u
                             INNER JOIN roles ON roles.id = users.role_id
                             INNER JOIN allocations a ON  a.assigned_to = u.id"

                if params[:role]
                    role = params[:role]
                    sql_query = sql_query + " INNER JOIN roles r on r.id = u.role_id WHERE r.role_name = '#{role}'"
                end

               sql_query = add_dates(sql_query)
               sql_query = add_group_by(sql_query, "u.username")           
               results = execute_query(sql_query)
               formated_result = []
               results.each do |result|
                    formated_result.push({username: result[0],
                         date_of_birth: result[1], email: result[2],
                         role_id: result[3], count: result[4]})
               end
               json_response(formated_result)
            end

            def add_group_by(sql_query, group_by_string)
                sql_query = sql_query + " GROUP BY #{group_by_string}"
            end

            def get_patient_encounters_by_staff
                staff_id = params[:staff_id]
                sql = "SELECT p.first_name, p.middle_name, p.family_name,
                       p.date_of_birth, p.email, p.address, p.phone_number, p.gender,
                       e.encounter_type, e.weight, e.height, e.temperature, e.bp,
                       e.patient_id, roles.*
                       FROM patients p
                       INNER JOIN encounters e on e.patient_id = p.id
                       INNER JOIN allocations a ON e.id  = a.assigned_to
                       WHERE a.assigned_to = #{staff_id}"
                sql = add_dates(sql)
                results = execute_query(sql)
                formated_string = []
                results.each do |result|
                    formated_string.push({first_name: result[0], middle_name: result[1], family_name: result[2],
                        date_of_birth: result[3], email: result[4], address: result[5], phone_number: result[6], gender: result[7],
                        encounter_type: result[8], weight: result[9], height: result[10], temperature: result[11], bp: result[12],
                        patient_id: result[13], role_name: result[15]})
                end
                json_response(formated_string)
            end

            def add_dates(sql_query)
                if params[:to] && params[:from]
                    from_date = params[:from]
                    to_date = params[:to]
                    condition = get_condition(sql_query)
                    sql_query = sql_query + " #{condition} date(a.created_at) BETWEEN '#{from_date}' and '#{to_date}'"
                elsif params[:from]
                    from_date = params[:from]
                    condition = get_condition(sql_query)
                    sql_query = sql_query + " #{condition} date(a.created_at) = '#{from_date}'"
                end 
                return sql_query
            end
            
            def execute_query(query)
                result = ActiveRecord::Base.connection.execute(query)
                result_string = []
                result.each do |row|
                    if row[0] == nil
                        json_response("No Records found", 404)
                        return
                    end
                result_string.push(row)
                end
                return result_string
            end

            def get_condition(sql_query)
                condition = 'AND'
                if !sql_query.include? 'WHERE'
                    condition = 'WHERE'
                end
                return condition
            end
        
        end
    end
end
