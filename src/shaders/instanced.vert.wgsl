struct Uniforms {
   viewProjectionMatrix: mat4x4f,
   modelMatrices : array<mat4x4f, 16>,
}

@group(0) @binding(0) var<uniform> uniforms : Uniforms;

struct VertexOutput {
   @builtin(position) Position : vec4f,
   @location(0) normal: vec3f,
   @location(1) fragUV : vec2f,
}

@vertex
fn main(
  @builtin(instance_index) instanceIdx : u32,
  @location(0) position : vec4f,
  @location(1) normal : vec3f,
  @location(2) uv : vec2f
) -> VertexOutput {
  var output : VertexOutput;
  output.Position = uniforms.viewProjectionMatrix * uniforms.modelMatrices[instanceIdx] * position;
  output.normal = (uniforms.modelMatrices[instanceIdx] * vec4f(normal.xyz, 0)).xyz;
  output.fragUV = uv;
  return output;
}
