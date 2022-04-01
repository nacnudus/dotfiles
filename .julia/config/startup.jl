try
    using Revise
catch e
    @warn "Error initializing Revise" exception=(e, catch_backtrace())
end

ENV["JULIA_EDITOR"] = "nvim"
