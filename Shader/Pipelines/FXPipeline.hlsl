#ifndef TYPOGRAPHY_FX_PIPELINE_INCLUDED
#define TYPOGRAPHY_FX_PIPELINE_INCLUDED

// ============================================================================
// FX Pipeline - Pre/Post Processing
// ============================================================================

// ============================================================================
// Input/Output Structures
// ============================================================================
struct fx_appdata
{
    float4 vertex : POSITION;
    float2 uv : TEXCOORD0;   // uv.x < 0 as FX marker
    float2 uv2 : TEXCOORD1;  // Clip space coords (-1,-1) to (1,1)
    UNITY_VERTEX_INPUT_INSTANCE_ID
};

struct fx_v2f
{
    float4 vertex : SV_POSITION;
    float4 grabPos : TEXCOORD0;
    UNITY_VERTEX_OUTPUT_STEREO
};

// ============================================================================
// Shared Vertex Shader
// ============================================================================
fx_v2f fx_vert(fx_appdata v, float fxPassUse)
{
    fx_v2f o;
    UNITY_SETUP_INSTANCE_ID(v);
    UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

    // Default: invisible
    o.vertex = float4(0, 0, -1, 1);
    o.grabPos = float4(0, 0, 0, 1);

    // Pass detection: FX = uv.x < 0
    if (v.uv.x >= 0) return o;

    // Runtime toggle check
    if (!fxPassUse) return o;

    // Use uv2 as clip space position for fullscreen quad
    o.vertex = float4(v.uv2.xy, 0, 1);
    o.grabPos = ComputeGrabScreenPos(o.vertex);

    return o;
}

// ============================================================================
// Pre Pass Fragment (Background passthrough)
// ============================================================================
inline half4 fx_pre_frag_impl(float4 grabPos, sampler2D preGrabTex)
{
    float2 uv = grabPos.xy / grabPos.w;
    return tex2D(preGrabTex, uv);
}

// ============================================================================
// Post Pass Fragment (Final composite passthrough)
// ============================================================================
inline half4 fx_post_frag_impl(float4 grabPos, sampler2D postGrabTex)
{
    float2 uv = grabPos.xy / grabPos.w;
    return tex2D(postGrabTex, uv);
}

#endif
