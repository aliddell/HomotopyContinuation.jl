export NullPredictor

"""
    NullPredictor()

A predictor which does no prediction step, i.e., it just returns the input as
its prediction.
"""
struct NullPredictor <: AbstractStatelessPredictor end
struct NullPredictorCache <: AbstractStatelessPredictorCache end

cache(::NullPredictor, H, x, t) = NullPredictorCache()

function predict!(xnext, ::NullPredictor, ::NullPredictorCache, H, x, t, dt)
    xnext .= x
    nothing
end

order(::NullPredictor) = 0
